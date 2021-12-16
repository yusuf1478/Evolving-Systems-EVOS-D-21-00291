function [gbest,gbestval]= PSO_func(Dimension,Particle_Number,Max_Gen,VRmin,VRmax)
rand('state',sum(100*clock));

% clear; clc;
% Max_Gen=30;
% Particle_Number=50;
% Dimension=6;
% VRmin=[95,45,270,0,0,0];
% VRmax=[290,160,560,180,180,180];


me=Max_Gen;
ps=Particle_Number;
D=Dimension;
cc=[2 2];   %acceleration constants
% iwt=0.9-(1:me).*(0.5./me);
%  iwt=0.5.*ones(1,me); 
 
%     iwt=0.6.*ones(1,me);         %orjinal
%     iwt=linspace(0.9,0.1,me);    %PSO91
%      iwt=linspace(0.1,0.9,me);    %PSO19
%    iwt=0.1.*ones(1,me);         %PSO11
%  iwt=0.5.*ones(1,me);         %PSO55
%   iwt=0.9.*ones(1,me);         %PSO99
  iwt=linspace(0.75,0.25,me);    %PSO72
%   iwt=linspace(0.25,0.75,me);    %PSO27
 
if length(VRmin)==1
    VRmin=repmat(VRmin,1,D);
    VRmax=repmat(VRmax,1,D);
end
mv=0.5*(VRmax-VRmin);
VRmin=repmat(VRmin,ps,1);
VRmax=repmat(VRmax,ps,1);
Vmin=repmat(-mv,ps,1);
Vmax=-Vmin;
pos=VRmin+(VRmax-VRmin).*rand(ps,D);

for j=1:ps
  e(j)=MAiN([pos(j,1),pos(j,2),pos(j,3),pos(j,4),pos(j,5),pos(j,6)]);
end



fitcount=ps;
vel=Vmin+2.*Vmax.*rand(ps,D);%initialize the velocity of the particles
pbest=pos;
pbestval=e; %initialize the pbest and the pbest's fitness value
[gbestval,gbestid]=min(pbestval);
gbest=pbest(gbestid,:);%initialize the gbest and the gbest's fitness value
gbestrep=repmat(gbest,ps,1);

for i=2:me
        aa=cc(1).*rand(ps,D).*(pbest-pos)+cc(2).*rand(ps,D).*(gbestrep-pos);
        vel=iwt(i).*vel+aa;
        vel=(vel>Vmax).*Vmax+(vel<=Vmax).*vel;
        vel=(vel<Vmin).*Vmin+(vel>=Vmin).*vel;
        pos=pos+vel;
        pos=((pos>=VRmin)&(pos<=VRmax)).*pos...
            +(pos<VRmin).*(VRmin+0.25.*(VRmax-VRmin).*rand(ps,D))+(pos>VRmax).*(VRmax-0.25.*(VRmax-VRmin).*rand(ps,D));
        for j=1:ps        
          e(j)=MAiN([pos(j,1),pos(j,2),pos(j,3),pos(j,4),pos(j,5),pos(j,6)]);
        end;
        fitcount=fitcount+ps;
        tmp=(pbestval<e);
        temp=repmat(tmp',1,D);
        pbest=temp.*pbest+(1-temp).*pos;
        pbestval=tmp.*pbestval+(1-tmp).*e;%update the pbest
        [gbestval,tmp]=min(pbestval);
        gbest=pbest(tmp,:);
        gbestrep=repmat(gbest,ps,1);%update the gbest
        %fprintf('Ýter=%d ObjVal=%g\n',i,gbest);
    end



