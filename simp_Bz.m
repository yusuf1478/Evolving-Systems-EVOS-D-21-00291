function SBz=simp_Bz(Nf,rc,zc,r,fi,z)
sum1=0;
sum2=0;
for n=0:Nf
    
if (n==Nf)||(n==0)
Sfi=1/3;
elseif mod(n,2)==1
Sfi=4/3;
elseif mod(n,2)==0
Sfi=2/3;
end

    for k=1:2
     
     g=1/(sqrt(r^2+rc^2-2*r*rc*cos(fi-2*pi*n/Nf)+(z-zc(k))^2));   
     sum1=sum1+((-1)^(k))*cos(2*pi*n/Nf)*g;  
         
    end
    sum2=sum2+ Sfi*sum1;
    sum1=0;
end

uo=4*pi*10^-7;
M=430000;

SBz=(uo*M*rc/(2*Nf))*sum2;

end
