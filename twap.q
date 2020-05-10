//Time Weighted Average calculation
//t:table as data
//c:columns, syms of sym, time and data columns, eg:`sym`time`price or `sym`time`bid`ask
//s:sym list
//t0:start time (inclusive)
//t1:end time (exclusive)
//
//eg: twap[select from quote where date=.z.d-1;`sym`time`bid`ask;`aapl`msft;12:00;12:15]
twap:{[t;c;s;t0;t1]
	//t:select from (c#t) where sym in s, time<t1;
	t:?[c#t;((in;c 0;enlist s);(<;c 1;t1));0b;()];
	//open:update time:t0 from 0!select by sym from t where time<t0
	open:![;();0b;enlist[c 1]!enlist[t0]] 0!?[t;enlist(<;c 1;t0);{x!x}1#c;()];
	//intrv:select from t where t0<=time;
	intrv:?[t;enlist(<=;t0;c 1);0b;()];
	?[open,intrv;();{x!x}1#c;(2_c)!({wavg[1_deltas y,x;z]}[t1];c 1),/:2_c]
 };
 
