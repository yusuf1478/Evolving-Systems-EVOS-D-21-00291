function E=LMnew(xs)
global gercekaki
gercekakilar=gercekaki;

Sens=[116 42 489;116 24 309;194 14 489;194 12 309;272 26 489;272 18 309]; % 6 Sensor


for i=1:size(Sens,1)

est=Main_YM(Sens(i,1),Sens(i,2),Sens(i,3),xs(1,1),xs(1,2),xs(1,3),xs(1,4),xs(1,5),xs(1,6));

re=gercekakilar(:,i);


E(1,i)=((est(1,1)-re(1,1))^2+(est(2,1)-re(2,1))^2+(est(3,1)-re(3,1))^2);

end

end