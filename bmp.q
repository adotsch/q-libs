\d .bmp

c24:{[r;g;b]"i"$b+256*g+256*r}

rgb24:{[img]
	h:count img;w:count img[0];ws:4 xbar 3+w*3;b4:{4#reverse 0x0 vs x};col:{-3#0x0 vs x};
	header:0x424d,b4[54+ws*h],0x000000003600000028000000,b4[w],b4[h],0x0100180000000000,b4[ws*h],0x130b0000130b00000000000000000000;
	img:raze each col''[img];if[ws-3*w;img:img,\:(ws-3*w)#0x0];
	:header,raze img
 }

\d .

//`:test.bmp 1: .bmp.rgb24 (.bmp.c24 .)''[(((255 0 0);(0 255 0));((0 0 255);(255 255 255)))]