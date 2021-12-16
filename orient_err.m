function rot = orient_err(g,b,a)

g=g*pi/180;
b=b*pi/180;
a=a*pi/180;

rot=[   cos(a)*cos(b)                       cos(a)*sin(b)*sin(g)-sin(a)*cos(g)       cos(a)*sin(b)*cos(g)+sin(a)*sin(g);...
        sin(a)*cos(b)                       sin(a)*sin(b)*sin(g)+cos(a)*cos(g)       sin(a)*sin(b)*cos(g)-cos(a)*sin(g);...
        -sin(b)                             cos(b)*sin(g)                            cos(b)*cos(g)];

end

