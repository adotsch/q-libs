/
q)c:.bitmap.new[16;16]
q)(.bitmap.line1[`c] .) each 2 cut/: 2{x cross x}/0 15;
q)-1 .bitmap.txt c;
oooooooooooooooo
oo            oo
o o          o o
o  o        o  o
o   o      o   o
o    o    o    o
o     o  o     o
o      oo      o
o      oo      o
o     o  o     o
o    o    o    o
o   o      o   o
o  o        o  o
o o          o o
oo            oo
oooooooooooooooo
q)-1 .bitmap.braille c;
⡟⢍⠉⠉⠉⠉⡩⢻
⡇⠀⠑⢄⡠⠊⠀⢸
⡇⠀⡠⠊⠑⢄⠀⢸
⣧⣊⣀⣀⣀⣀⣑⣼


q)c:.bitmap.new[64;64]
q)-1 .bitmap.braille .bitmap.plot1[c] . 31*1+(sin;cos)@\: key 1000; 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠤⠤⠤⠴⠤⠤⠤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                    
⠀⠀⠀⠀⠀⠀⣀⠴⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠦⣀⠀⠀⠀⠀⠀⠀⠀                                    
⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀                                    
⠀⠀⢠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡄⠀⠀⠀                                    
⠀⣰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀                                    
⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀                                    
⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⠀                                    
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀                                    
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀                                    
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀                                    
⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠀                                    
⠀⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⠀                                    
⠀⠈⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠁⠀⠀                                    
⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀                                    
⠀⠀⠀⠀⠀⠙⠦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠴⠋⠀⠀⠀⠀⠀⠀                                    
⠀⠀⠀⠀⠀⠀⠀⠈⠙⠒⠤⢤⣀⣀⣀⣀⣀⣀⣀⡤⠤⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀                                    


q)c:.bitmap.new[64;64]
q){.bitmap.line[`c;(31.5;31.5);31.5*1+(sin x;cos x);1010101b]}each key 1000
q)-1 .bitmap.braille c;
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣶⣿⣿⣿⣿⣿⣿⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⡠⣾⣿⣿⠟⠋⠉⠁⠀⠀⠀⠀⠈⠉⠛⠻⣿⣿⣷⢄⡀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣴⣿⡿⠊⠀⠀⠀⣠⣴⣶⣶⣶⣶⣶⣶⣦⣄⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀
⠀⠀⣠⣿⡿⠋⠀⢀⣤⣾⣿⣿⠟⠛⠋⠉⠉⠙⠛⠻⣿⣿⣷⣤⣀⠀⠉⢻⣿⣄⠀⠀
⠀⣰⣿⡿⠃⠀⢠⣾⣿⠟⠉⠀⠀⣀⣤⣤⣤⣤⣀⠀⠀⠉⠛⢿⣿⣆⠀⠀⢿⣿⣆⠀
⢠⣿⡿⠁⠀⣴⣿⡿⠏⠀⢀⣶⣿⣿⠿⠛⠛⠿⣿⣿⣷⣄⠀⠈⢿⣿⣆⠀⠈⣿⣿⡄
⣼⣿⠇⠀⠀⣿⣿⠃⠀⢠⣾⣿⠟⠀⠀⣀⣀⠀⠀⠘⢿⣿⡆⠀⠈⣿⣿⡆⠀⠸⣿⣧
⣿⣿⠀⠀⢸⣿⣿⠀⠀⣼⣿⡏⠀⠀⣼⣿⣿⣿⡆⠀⠘⣿⣿⠀⠀⢹⣿⡇⠀⠀⣿⣿
⣿⣿⠀⠀⢸⣿⣿⠀⠀⢿⣿⣧⠀⠀⠻⣿⣿⡿⠃⠀⣰⣿⡿⠀⠀⣸⣿⡇⠀⠀⣿⣿
⢻⣿⡆⠀⠀⣿⣿⡆⠀⠈⢿⣿⣦⡀⠀⠀⠀⠀⢀⣠⣿⣿⠃⠀⢀⣿⣿⠇⠀⢸⣿⡟
⠘⣿⣿⡀⠀⠻⣿⣷⣆⠀⠈⠻⢿⣿⣿⣶⣶⣾⣿⣿⠿⠃⠀⢠⣿⣿⠋⠀⢀⣿⣿⠃
⠀⠹⣿⣷⡄⠀⠘⢿⣿⣷⣄⡀⠀⠉⠉⠛⠛⠉⠉⠀⠀⣠⣴⣿⣿⠋⠀⠀⣿⣿⠏⠀
⠀⠀⠙⣿⣷⣄⠀⠈⠙⠷⣿⣿⣶⣤⣤⣤⣤⣤⣴⣶⣾⣿⠯⠋⠁⠀⣠⣾⣿⠋⠀⠀
⠀⠀⠀⠈⠻⣿⣷⣄⣀⠀⠀⠛⠛⠛⠿⠿⠿⠿⠛⠛⠋⠁⠀⢀⣠⣼⣿⠟⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠑⢿⣿⣿⣦⣄⣀⡀⠀⠀⠀⠀⢀⣀⣤⣴⣾⣿⡿⠊⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⠿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀

q)

q)c:.bitmap.genjjb[40;40]{0=div[;2](x*/:y)mod 13}
q)-1 .bitmap.braille c;

⡏⠉⡉⠍⠉⠉⢻⠉⢉⠩⠉⠉⠙⡏⠉⡉⠍⠉⠉⢻
⡇⠌⠐⠀⠀⢀⢸⠠⠁⠂⠀⠀⡀⡇⠌⠐⠀⠀⢀⢸
⡇⠀⠀⢀⠡⠂⢸⠀⠀⠀⡈⠔⠀⡇⠀⠀⢀⠡⠂⢸
⡟⠒⠒⡒⠒⠒⢾⠓⠒⢒⠒⠒⠲⡟⠒⠒⡒⠒⠒⢾
⡇⡐⠡⠀⠀⠀⢸⢀⠊⠄⠀⠀⠀⡇⡐⠡⠀⠀⠀⢸
⡇⠀⠀⠀⢂⠌⢸⠀⠀⠀⠐⡠⠁⡇⠀⠀⠀⢂⠌⢸
⡷⠤⠤⠬⠤⠤⣼⠦⠤⠤⠥⠤⢤⡷⠤⠤⠬⠤⠤⣼
⡇⠠⢂⠁⠀⠀⢸⠀⠔⡈⠀⠀⠀⡇⠠⢂⠁⠀⠀⢸
⡇⠁⠀⠀⠄⡐⢸⠈⠀⠀⠠⢀⠂⡇⠁⠀⠀⠄⡐⢸
⣧⣀⣀⣐⣈⣀⣸⣄⣀⣀⣂⣁⣀⣧⣀⣀⣐⣈⣀⣸


q)c:.bitmap.genffb[40;40]{0.25>(x-.5){(x*x)+y*y}/:y-.5}
q)q)-1 .bitmap.braille c;
⠀⠀⠀⠀⢀⣤⣶⣶⣿⣿⣿⣿⣶⣶⣤⡀⠀⠀⠀⠀
⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀
⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀
⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀
⠀⠀⠀⠀⠈⠛⠿⠿⣿⣿⣿⣿⠿⠿⠛⠁⠀⠀⠀⠀


q)c:.bitmap.genfff[80;60]{.5*1+sin 7*sin[6*x]+/:sin 6*y}
q)-1 .bitmap.braille c;
⡆⠈⡫⡿⣦⡦⡦⡂⡠⡢⣦⡾⡿⠋⡀⡢⣾⡯⡋⠀⣠⣦⣮⣮⣦⡦⡦⡀⡊⠻⣯⡦⡀⠋⡿⣿⣦⡢⡢⡂
⣿⡦⡀⠊⡫⡿⣿⡿⣿⡿⡯⡋⡂⡀⣮⡿⡋⠂⣢⣾⣿⡿⡯⡫⡯⡻⣿⣯⡦⡀⡪⡿⣧⡂⡀⠋⡿⡿⣿⡿
⡫⣿⡦⡂⡀⠊⡫⡫⡯⡋⡂⠀⡠⣺⣿⡋⡀⡪⣿⡿⡯⡊⡂⠂⡀⠊⡪⡿⣯⡂⡀⠪⣿⡯⡂⠀⡊⡪⡯⡫
⣪⣿⡯⡂⡀⠂⡪⡪⡮⡂⡂⠀⡪⡿⣯⡂⡀⡪⣿⡯⡦⡂⡀⠀⡀⠂⡪⣿⣿⡏⡂⠊⣿⡿⡆⠂⡀⡊⡪⡪
⣾⡿⡃⠀⡠⡪⣮⣿⣯⡯⡦⡂⡀⠪⣿⡯⡂⠊⡫⣿⣯⡢⡢⡂⡢⡪⣮⡿⡯⠂⡀⣪⣿⡋⡂⡀⣢⣮⣯⣿
⡯⠃⡠⣪⣾⡿⡿⡻⡯⡿⣿⣯⡦⡀⡪⡻⣯⡂⡀⠋⡿⡿⣿⡿⣿⡿⡯⠋⡂⡠⣮⡿⡋⠀⣢⣾⡿⡿⡯⡻
⡠⣪⡿⡋⡋⠂⡀⡀⡀⡀⡈⠋⡿⣯⣦⡈⡫⡿⣦⡂⡀⠊⡊⠋⡋⠊⡀⡢⣮⡿⡋⠂⣠⡾⡿⠋⡊⡀⡀⡀
⡿⡋⡂⡀⣦⡾⣿⡿⣿⡿⣦⡦⡀⠊⡻⣯⣦⡈⡫⡻⣿⣮⣦⣦⣦⣮⡾⡿⡋⠂⣠⡾⡯⠋⡀⡢⣮⡾⡿⡿
⡂⡠⣮⡿⡯⠋⡊⠊⡈⠊⡫⡻⣿⡦⡀⠊⡻⣯⡦⡀⡈⠋⡫⡫⡫⠋⡊⠀⣢⡾⡯⠋⡀⣢⣾⡿⡋⠋⡊⠊
⣢⡿⡯⠋⡀⡂⡢⡢⣦⡂⡀⠀⡪⡻⣯⡂⡀⠫⣿⣯⡦⡂⡀⠀⡀⡀⣢⣾⡿⡋⡂⡠⣾⡿⡋⠂⡀⡢⣦⡢
⣿⡯⡂⠀⡢⡮⣿⣿⣿⡯⡮⡂⡀⠊⣿⡯⡂⠀⡪⣿⣯⡯⡦⡢⡢⡪⣿⡿⡯⠂⡠⣺⣿⡋⡀⠂⣮⣿⣿⣿
⣿⡯⡂⠀⡪⡻⣿⣿⣿⡿⡯⡂⡀⡪⣿⡯⡂⠀⡪⣿⣿⡯⡮⡊⡪⡫⣿⣿⡧⡂⡨⡻⣯⡂⡀⠊⡮⡿⣿⡿
⡫⣿⡦⡂⡀⠊⡫⡫⡯⡋⡂⠂⡠⣾⡿⡋⡀⡢⣾⡿⡯⠊⡂⠂⡀⠊⡫⡿⣯⡆⡀⠪⣿⡯⡂⠀⡊⠋⡫⡫
⡀⠋⡿⣯⣦⡂⡀⡀⡀⡀⡠⣪⣾⡯⡋⡀⣮⡿⡯⠋⡀⡀⣢⡢⣦⡂⡀⠊⡫⡿⣦⡂⡈⠻⣿⡦⡦⡀⡀⡀
⣧⡂⡈⠋⡿⡿⣿⡾⣮⡿⡿⡋⡋⡀⣦⡾⡯⠋⡠⣢⣾⡿⡿⡻⡿⡿⣯⣦⡂⡈⡫⡿⣦⡀⡊⠻⡿⡿⣮⡾
\

\d .bitmap

//Create new bitmap with .bitmap.new[width;height]
new:{`w`h`d!(x;y;#[x*y]0b)}
//Generate new bitmap with function, "J" "J" -> ("B";"B";...)
genjjb:{[w;h;f]`w`h`d!(w;h;raze f[key w;key h])}
//Generate new bitmap with function, "F" "F" -> ("B";"B";...)
genffb:{[w;h;f]s:1%w&h;`w`h`d!(w;h;raze f[s*.5+key w;s*.5+key h])}
//Generate new bitmap with function, "F" "F" -> ("F";"F";...)
genfff:{[w;h;f]s:1%w&h;`w`h`d!(w;h;raze (h#w#/:dth)<=f[s*.5+key w;s*.5+key h])}

//Draw a single or a series of plots with (dithered) color(s)
/ bm:  bitmap by sym reference or value
/ x,y: two coordinates or coordinate vectors of the same length
/ c:   sigle color (0b,1b or 0<=c<=1) or a vector of colors. The vector is resized to match x and y.
plot:{[bm;x;y;c]
    x:floor (),x;y:floor (),y;
    c:("f"$(),c)floor key[count x]*count[c]%count x;
    i:where 0<=x&y;x@:i;y@:i;c@:i;
    i:where (x<bm`w)&y<bm`h;x@:i;y@:i;c@:i;
    c>:dthr mod[x;4]+4*mod[y;4];
    .[bm;(`d;x+y*bm`w);:;c]
 }

//shorcuts
plot1:plot[;;;1b]
plot0:plot[;;;0b]
plotfx:{[bm;f;x;c]plot[bm;x;f'[x];c]}

//Draw a line between a and b with (dithered) color(s)
/ bm:  bitmap by sym reference or value
/ a,b: coordinate pairs
/ c:   sigle color (0b,1b or 0<=c<=1) or a vector of colors, used to color the line from a to b.
line:{[bm;a;b;c]
    a:"j"$a;b:"j"$b;
    if[a~b;:plot[bm;;;c] . a];
    s:{key[1+x]%x}max abs a-b;
    plot[bm;;;c].(a+.5)+s*/:b-a
 }

//shorcuts
line1:line[;;;1b]
line0:line[;;;0b]

//4x4 Bayer matrix for dithering
dth:(0 12 3 15;8 4 11 7;2 14 1 13;10 6 9 5)%16
dthr:raze dth;

//U+2800..., i.e. Braille chars
brChar:(256 sv 0x2800)+ 0 1 8 2 16 4 32 64 128 wsum flip 2 vs/:256+key 256

//TXT representation of the bitmap with " " and "o".
txt:{[bm]" o"reverse (cut). bm`w`d};

//Braille (UTF-8) representation of the bitmap.
braille:{[bm]
    if[not `utf8 in key`;'"Requries utf8.q!"];
    d:reverse (cut). bm`w`d;
    if[hm:mod[bm`h]4;d,:(4-hm)#enlist(bm`w)#0b];
    if[mod[bm`w]2;d:d,\:0b];
    blocks:flip ({2 sv raze x} each 4 cut) each flip(2 cut)each d;
    .utf8.enJ each brChar blocks
 }
