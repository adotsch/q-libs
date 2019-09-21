\d .callback

cbs:(1#`)!enlist();
throw:{0N!"error in callback: ",x;({'x};x)};
runcbs:{value first{@[(::;)y .;x;throw]}[y]each cbs x};
addcb:{c:@[get;x;{}];if[null c;:x set y];r:runcbs[x]enlist::;cbs[x set r],:$[c~r;y;(c;y)]};

.q.addcallback:addcb;
