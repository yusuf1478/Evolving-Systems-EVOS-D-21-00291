function turned_YM=Main_YM(xs,ys,zs,xm,ym,zm,g,b,a)
Nf=10;
rdis=15/2;
ric=10/2;
zc=[-3 3];

g=g*pi/180;
b=b*pi/180;
a=a*pi/180;

RbA=[   cos(a)*cos(b)                       cos(a)*sin(b)*sin(g)-sin(a)*cos(g)       cos(a)*sin(b)*cos(g)+sin(a)*sin(g);...
        sin(a)*cos(b)                       sin(a)*sin(b)*sin(g)+cos(a)*cos(g)       sin(a)*sin(b)*cos(g)-cos(a)*sin(g);...
        -sin(b)                             cos(b)*sin(g)                            cos(b)*cos(g)];

yenixyz=RbA'*[(xs-xm);(ys-ym);(zs-zm)];

x=yenixyz(1,:);
y=yenixyz(2,:);
z=yenixyz(3,:);

R=sqrt(x.^2+y.^2);
Fi=atan2(y,x); 
Z=z;

r=R;
fi=Fi;
z=Z;

Br=simp_Br(Nf,rdis,zc,r,fi,z)-simp_Br(Nf,ric,zc,r,fi,z);
Bfi=simp_Bfi(Nf,rdis,zc,r,fi,z)-simp_Bfi(Nf,ric,zc,r,fi,z);
Bz=simp_Bz(Nf,rdis,zc,r,fi,z)-simp_Bz(Nf,ric,zc,r,fi,z);

BB=[Br';Bfi';Bz'];

turnedlokal=[cos(Fi) -sin(Fi) 0; sin(Fi) cos(Fi) 0; 0 0 1]*BB;
 
turned_YM=RbA*turnedlokal;
end
