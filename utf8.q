\d .utf8

f:{'`range},("c"$),{"c"$192 128+64 vs x},{"c"$224 128 128+64 vs x},{"c"$240 128 128 128+64 vs x},{'`range}
e:`s#-0W 0 128 2048 65536 1114112!f

//encode long or long vector
enj:{e[x]x};enJ:{raze e[x]@'x}
//encode hex (bytes)
enx:{enj 256 sv x}

