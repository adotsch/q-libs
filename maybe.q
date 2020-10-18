/########################
/# The maybe monad in q #
/########################
/Monadic value constructors
just:(`ok;); err:(`err;); nothing:`nothing,1_parse"{}[]"
/Chenks for monadic values
isOk:{`ok~first x}; isErr:{`err~first x}; isNothing:{`nothing~first x}
/Safe at (@)
sAt:{$[isErr x;x;isErr y;y;@[just@last[x]@;last y;err]]}
/Safe dot (.), use nothing to yield projection
sDot:{$[isErr x;x;any e:isErr'[y];y first where e;@[just@last[x].;last'[y];err]]}
/The value in the monad
mval:last