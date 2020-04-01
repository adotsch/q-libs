\d .connection

//active connections in/out
C:`.connection.connections;
C set ([w:0#0i]u:();h:();a:();to:());
//connection history
H:`.connection.history;
H set ([]u:();h:();a:();to:();tc:());
//functions to call in .z.pc when client diconnects, 
//client should call .connection.onClientDisconnect[.z.w]:{...}
D:`.connection.onClientDisconnect;
D set ()!();
//managed connections
M:`.connection.managed
M set ([h:()];w:0#0i;con:();recon:();discon:());
//messages waiting to be sent async
Q:`.connection.asyncQueue
Q set ([]h:();m:()) upsert (`;*);

//conneciton timeout is 1 sec
TIMEOUT:1000;
//the history we keep in memory
HIST:01:00:00;

//Conenct to h, call monadic con, recon and dicon with the int handle on 
//(1st) connection, reconnection and disconnection respectively.
connect:{[h;con;recon;discon]M upsert (h;0Ni;con;recon;discon);reconnect`};

connected:{[]exec h from M where not null w};

//Disconnect from h and clear queue
disconnect:{[h]if[not null w:handle h;hclose w;.z.pc w];.[M;();_;h];clearQueue h};

logger:(::);    //{-1 string[.z.p]," - ",.Q.s1 x;x};

//Send async message, connecect if not connected, queue message until connecton is not up.
asend:{[h;m]Q upsert enlist logger(h;m);$[h in key M;trySend`;connect[h;::;::;::]]};

//update or set callbacks after connect or asend
onReconnect: {[h;f].[M;h,`recon ;:;f];};
onDisconnect:{[h;f].[M;h,`discon;:;f];};

//Clear queued messages for handle.
clearQueue:{delete from Q where h=x;};

//Try to send messages in queue.
trySend:{[]
    hs:exec h from M where not null w;
    d:{[hs;h;m]$[h in hs;@[neg[handle h];m;0];0]}[hs]'[Q`h;Q`m];
    delete from Q where null d;
 };

//Int handle for h
handle:{[h]M[h;`w]};

//Timer function to handle reconnections
reconnect:{[]
    {[h]
        w:@[hopen;(h;TIMEOUT);0Ni];
        if[not null w;
            C upsert (w;`;h;0Ni;.z.p);
            f:{x null x 0}M[h]`con`recon;
            .[M;(h;`w`con);:;(w;(::))];
            f w;
        ]
    } each exec h from M where null w;
    trySend`
 };

shrinkHist:{delete from H where to<.z.p-.connection.HIST};

//Init, sets .z.ts and \t 1000. 
//addTimer is either null or an alternative to (`.z.ts set) (default).
//Also sets .z.po,.z.pc, keeps existing functionality.
init:{[addTimer]
    {$[null x;`.z.ts set;x]}[addTimer] reconnect;system"t 1000";
    po:@[get;`.z.po;{}];pc:@[get;`.z.pc;{}];
    .z.po:{@[x;y;{}];C upsert (y;.z.u;.Q.host .z.a;.z.a;.z.p);}[po];
    .z.pc:{@[x;y;{}];
        shrinkHist[] upsert enlist @[C[y];`tc;:;.z.p];
        D[y]y;exec discon@'w from M where w=y;.[;();_;y]'[C,D];
        update w:0Ni from M where w=y;}[pc];
 };