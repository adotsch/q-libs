/

A naive implementation of a real-time subscriber that computes open,close,high,low,mid,hloc,avg price and vwap on 
ticking trade data.

BARS   : closed bars
BARS_RS: real-time updating bars

Eg.:
q rts/bar.q -tp ::5000 -barsize 00:01:00

\

.opt:.Q.def[`tp`barsize!(`::8080;"n"$00:00:01)] .Q.opt .z.x;

h:hopen .opt.tp;

//we expect sym,time,price,size columns
h".u.sub[`trade;`]";  

barsLatest:barsClosed:flip `sym`time`open`close`low`high`psum`n`wpsum`w!"spfffffjfj"$\:();

//closed bars
BARS::    select sym,time,open,close,low,high,mid:avg(low;high),hloc:avg(high;low;open;close),avgp:psum%n,vwap:wpsum%w,volume:w,ticks:n from barsClosed
//real-time updating bars
BARS_RT:: select sym,time,open,close,low,high,mid:avg(low;high),hloc:avg(high;low;open;close),avgp:psum%n,vwap:wpsum%w,volume:w,ticks:n from barsLatest

upd.trade:{[x]
    p:0!select 
        open:first price, 
        close:last price, 
        low:min price, 
        high:max price, 
        psum:sum price, 
        n:count[price], 
        wpsum: wsum[size;price], 
        w:sum size 
            by sym,time:.opt.barsize xbar time from x;
    barsLatest::0!select 
        open:first open, 
        close:last close, 
        low:min low, 
        high:max high, 
        psum:sum psum, 
        n:sum n, 
        wpsum: sum wpsum, 
        w:sum w 
            by sym,time from barsLatest,p;
    fin:barsLatest.time<(last;barsLatest.time) fby barsLatest.sym;
    `barsClosed upsert barsLatest where fin;
    delete from `barsLatest where fin;
 };
