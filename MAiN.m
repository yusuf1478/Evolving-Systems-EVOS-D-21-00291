function [E]=MAiN(pop)
global gercekaki
gercekakilar=gercekaki;
xm=pop(1,1);
ym=pop(1,2);
zm=pop(1,3);
g=pop(1,4);
b=pop(1,5);
a=pop(1,6);

Sens=[116 42 489;116 24 309;194 14 489;194 12 309;272 26 489;272 18 309]; % 6 Sensor

E=0;
for i=1:size(Sens,1)

est=Main_YM(Sens(i,1),Sens(i,2),Sens(i,3),xm,ym,zm,g,b,a);
% re=gercekveri{m,i};
re=gercekakilar(:,i);
%% Bx,By,Bz
E=E+((est(1,1)-re(1,1))^2+(est(2,1)-re(2,1))^2+(est(3,1)-re(3,1))^2);
%% Bt
% esti=sqrt(sum(est.^2));
% rei=sqrt(sum(re.^2));
% E=E+(esti-rei)^2;
%% Bx,By,Bz,Bt
% esti=sqrt(sum(est.^2));
% rei=sqrt(sum(re.^2));
% E=E+((est(1,1)-re(1,1))^2+(est(2,1)-re(2,1))^2+(est(3,1)-re(3,1))^2)+(esti-rei)^2;


end





end