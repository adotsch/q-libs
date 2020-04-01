manager:`::5000;
tasks:([]id:();worker:();dep:();task:());

//add (t)ask to execute on (w)orkers with list of (d)ependencies 
addTask:{[w;t;d]`tasks upsert(i:manager"{x}.scheduler.lastid+:1";w;"j"$(),d;t);i};

//send worker tasks to manager
execute:{[].connection.asend[manager](`.scheduler.addTask;tasks);tasks::0#tasks;};

//cancel task execution (eg. because client disconnected)
cancel:{[id]manager(`.scheduler.removeTask;id);};
