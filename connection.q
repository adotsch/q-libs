\d .connection

//active connections in/out
C:`.connection.conns;
C set ([w:0#0i]u:();h:();a:();to:());
//connection history
H:`.connection.hist;
H set ([]u:();h:();a:();to:();tc:());
//functions to call in .z.pc per handle
D:`.connection.discon;
D set ([w:0#0i]f:());
//managed connections
M:`.connection.managed
M set ([h:()];w:0#0i;con:();recon:();discon:());

//conneciton timeout
TIMEOUT:1000;
//the hist we keep in mem
HIST:01:00:00;

//Conenct to h, call monadic con, recon and dicon with the int handle on 
//(1st) connection, reconnection and disconnection respectively.
connect:{[h;con;recon;discon]M upsert (h;0Ni;con;recon;discon);reconnect[];};

//Disconnect from h
disconnect:{[h]if[not null w:handle h;hclose w;.z.pc w];.[M;();_;h];};

//Int handle for h
handle:{[h]M[h;`w]};

//Timer function to handle reconnections
reconnect:{[]
    {[h]
        w:@[hopen;(h;TIMEOUT);0Ni];
        if[not null w;
            C upsert (w;`;h;0Ni;.z.p);
            D upsert (w;M[h]`discon);
            f:{x null x 0}M[h]`con`recon;
            .[M;(h;`w`con);:;(w;(::))];
            f w;
        ]
    } each exec h from M where null w;
 };

shrinkHist:{delete from H where to<.z.p-.connection.HIST};

//Initialize, addTimer is either null or an alternative to (`.z.ts set) (default)
init:{[addTimer]
    {$[null x;`.z.ts set;x]}[addTimer] reconnect;
    po:$[count key `.z.po;.z.po;{}];
    pc:$[count key `.z.pc;.z.pc;{}];
    .z.po:{@[x;y;{}];C upsert (y;.z.u;.Q.host .z.a;.z.a;.z.p);}[po];
    .z.pc:{@[x;y;{}];
        shrinkHist[] upsert enlist @[C[y];`tc;:;.z.p];
        D[y;`f]y;.[;();_;y]'[C,D];
        update w:0Ni from M where w=y;}[pc];
 };