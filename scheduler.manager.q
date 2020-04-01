\d .scheduler

self:`::5000;

//status transitions: 
// 1 waiting      : not started yet
//   2 queued     : the sub-task has all the dependencies on the worker and scheduler issued start
//     3 running  : the task is running
//       4 done   : the task is done
//       4 error  : the task returned an error or worker failed (crash, wsfull, etc)
//   2 skip       : tasks with dependency errors
T:`.scheduler.tasks;
tasks: ([]id:();worker:();dep:();task:();status:();delivered:();sink:());
workers:0#`;
lastid:"j"$.z.p div 10000;


//called by client to add new dependency graph(s)
addTask:{[t]
    T upsert update status:`waiting, delivered:enlist 0#0, sink:not id in raze dep from t;
    //remove and replace task duplicates that are waiting, queued or running
    optimize:{[t]
        reid:({x!x}t`id),exec id!(first;id) fby flip[(worker;dep;task)] from t 
          where status in `waiting`queued`running, not sink;
        update dep:reid dep from delete from t where id<>reid id //remove and replace
    };
    tasks::optimize/[tasks]; //iterate until no tasks can be removed
    initWorkers`;runTasks`;
 };

//called by worker/.z.pc to update status
status:{[j;s]
    r:exec from T where id=j;h:r`worker;
    if[`error~first s;
        err:r[`worker],s 1;s:`error;
    ];
    update status:s from T where id=j;
    if[s~`done;
        //result needed by the same worker stays there
        setDelivered[j]h;
        //result needed by other workers needs to be delivered
        hs:exec distinct worker from T where j in/:dep,worker<>h;
        if[count hs;.connection.asend[h](`.scheduler.deliver;self;j;hs)];
    ];
    if[s~`error;
        update status:`error from T where id=j;
        //send err to sinks
        deps:distinct raze{exec id from tasks where any'[x in/:dep]}\[r`id];  //dependees
        update status:`skip from T where not sink,status=`waiting,id in deps; //skip
        sinks:select id,worker,task from tasks where sink, id in deps;
        distinct[sinks`worker] .connection.asend\:(`.scheduler.results upsert;(j;1b;err));
        //call sinks
        {[j;k;w;t]
            .connection.asend[w](`.scheduler.run;k;t;1#j;1b);
            update status:`queued from T where id=k;
        }[j]'[sinks`id;sinks`worker;sinks`task];
    ];
    if[s in `done`error;
        //clean up after sink is called
        if[r`sink;removeTask j];
        //delete obsolate results
        if[$[s~`done;r[`sink]|0<count hs;1b];
            .connection.asend[h](`.scheduler.keep; (tasks.id where tasks.status=`done) inter
                distinct raze exec dep from tasks where worker=h,status in`waiting`queued`running)]
    ];
    //start tasks
    runTasks`;
 };

setDelivered:{[j;h]update delivered:delivered(,)\:j from T where j in/: dep, worker=h};

//worker calls this
delivered:{[j;h]setDelivered[j]h;runTasks`;};

//to minimize includes we init workers with this function
worker.init:{[]

    {if[not x~key x;x set y]}[`.scheduler.results]([]id:();e:();r:()) upsert (0N;0b;*);

    .scheduler.run:{[j;t;dep;sink]
        .z.w(`.scheduler.status;j;`running);
        d:(exec id!([]e;r) from results)dep;
        er:$[sink;
            .Q.trp[(0b;)t .;
                $[any d`e;(1b;(d`r)first where d`e);(0b;d`r)];
                {(1b;(x;y))}];
            .Q.trp[(0b;)t @;d`r;{(1b;(x;y))}]];
        `.scheduler.results upsert enlist`id`e`r!j,er;
        .z.w(`.scheduler.status;j;(`done;(`error;er 1)) er 0);
    };

    .scheduler.deliver:{[s;j;hs]
        hs {[s;h;m]
            .connection.asend[h](
                {[s;h;m]`.scheduler.results upsert m;.connection.asend[s](`.scheduler.delivered;m 0;h);};
                s;h;m);
        }[s]\:value first results where results.id=j;
    };

    .scheduler.keep:{[ids]delete from `.scheduler.results where not id in (ids,0N);};

 };

//connect, init and set callbacks for new workers
initWorkers:{[]
    nw:(distinct exec worker from T) except workers;
    {[h].connection.connect[h;::;{neg[x](worker.init;`);runTasks`};{[h;w]workerFailed h}h]} each nw;
    workers,:nw;
 };

//starts tasks on idle workers
runTasks:{[]
    startid:exec id from tasks where status=`waiting, 0=count'[dep except' delivered];
    idle:(.connection.connected[] inter workers) except 
        tasks.worker where tasks.status in `queued`running;
    start:{[w;j;t;d;s]
        .connection.asend[w](`.scheduler.run;j;t;d;s);
        update status:`queued from T where id=j;};
    exec start'[worker;id;task;dep;sink] from tasks 
        where id in startid, worker in idle, id = (first;id) fby worker;
 };

//.z.pc calls this
workerFailed:{[h]
    //TODO: impl
    //tasks depending on results stored on h and the failuers due to results not delivered
    //d:exec id from tasks where worker=h,status=`done;
    //f:exec id from tasks where status=`waiting,worker=h ,any'[d in/:dep];
    //f{0(`.scheduler.status;x;y)}\:(`error;("result lost";()));
    //f:exec id from tasks where status=`waiting,worker<>h,any'[d in/:dep except' delivered];
    //f{0(`.scheduler.status;x;y)}\:(`error;("delivery failed";()));
    //the task that failed
    //is:exec id from T where worker=h, status in `queued`running;
    //is{0(`.scheduler.status;x;y)}\:(`error;("worker failed";()));
 };

//removes a sink task and its obsolate (i.e. not shared) dependencies
removeTask:{[j]
    delete from T where id=j;
    tasks::{[t]
        deps:distinct raze exec dep from t where status in`waiting`queued;
        delete from t where not sink,not id in deps
    }/[tasks];
 };