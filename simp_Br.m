function SBr=simp_Br(Nf,rc,zc,r,fi,z)

sum=0;

for n=0:Nf
    
if (n==Nf)||(n==0)
Sfi=1/3;
elseif mod(n,2)==1
Sfi=4/3;
elseif mod(n,2)==0
Sfi=2/3;
end     
    
    for k=1:2
     
     if (r^2+rc^2-2*r*rc*cos(fi-2*pi*n/Nf))~=0
        g=1/(sqrt(r^2+rc^2-2*r*rc*cos(fi-2*pi*n/Nf)+(z-zc(k))^2));
        F=((z-zc(k))*g)/(r^2+rc^2-2*r*rc*cos(fi-2*pi*n/Nf));  
        I=F;
     else
     end
     
     if (r==rc)&&(cos(fi-2*pi*n/Nf)==1)&&(z~=zc(k))
     I=-1/(2*(z-zc(k))^2);
     end

     sum=sum+ ((-1)^(k+1))*Sfi*cos(2*pi*n/Nf)*(r-rc*(cos(fi-(2*pi*n/Nf))))*I;  
           
    end

uo=4*pi*10^-7;
M=430000;
SBr=(uo*M*rc/(2*Nf))*sum;

end

end