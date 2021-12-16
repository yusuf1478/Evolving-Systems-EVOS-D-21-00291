
%%
clc;
clear;
load refineo.mat
load gercek_deger_nf10.mat
global gercekaki


Sonuc=cell(317,4);

run=1;
nokta=317;
for f=1:run
tic;
for m=1:nokta
gercekaki=[gercek_deger{m,1},gercek_deger{m,2},gercek_deger{m,3},gercek_deger{m,4},gercek_deger{m,5},gercek_deger{m,6}];
    D=6; % bilinmeyen
    VRmin=[95,45,270,0,0,0];
    VRmax=[290,160,560,180,180,180];
    pop_size=30;
    iter_max=50;
   
   
%    [gbestABC,gbestvalABC]= ABC_func(D,pop_size,iter_max,VRmin,VRmax);
%   [gbestABC,gbestvalABC]= DE_func(D,pop_size,iter_max,VRmin,VRmax);
%     [gbestABC,gbestvalABC]= PSO_func(D,pop_size,iter_max,VRmin,VRmax);
%    [gbestABC,gbestvalABC]= TLBO_func(D,pop_size,iter_max,VRmin,VRmax);
% [gbestABC,gbestvalABC,con]=GSA_func2(D,pop_size,iter_max,VRmin,VRmax);
%     [gbestABC,gbestvalABC]=GSA3(D,pop_size,iter_max,VRmin,VRmax);
      [gbestABC,gbestvalABC,cov]=WOA(D,pop_size,iter_max,VRmin,VRmax);

%%--------GA 
%    options = optimoptions('ga');
%    options = optimoptions(options,'MaxGenerations',iter_max);
%    options.CrossoverFraction = 0.9;
%    options.PopulationSize = pop_size;
%    gbestABC=ga(@(x) MAiN(x),D,[],[],[],[],VRmin,VRmax,[],[],options);
%%---------GA
% clc;
% Sadece LM
% gbestABC=VRmin+(VRmax-VRmin).*rand(1,6);
% gbestABC=[190, 100, 300, 90, 90, 90]; % rand(95 - 290)

%    netice=LMcode_new(gbestABC,1e-25,1e-10); 
   netice=  gbestABC;     

Sonuc{m,1}(f,:)=netice;

% clearvars -except refine real Sonuc;
end
% conn(f,:) = cov;
time(f)=toc;
end
time_mean = mean(time);

for s=1:nokta
Sonuc{s,2}=abs(Sonuc{s,1}(1:end,1:3)-repmat(refine(s,1:3),run,1));
rot_real=(orient_err(refine(s,4),refine(s,5),refine(s,6))*[1;0;0])';

for f=1:run

Sonuc{s,2}(f,4)=mean(sqrt(sum(Sonuc{s,2}(f,:).^2,2)));
rot_est=(orient_err(Sonuc{s,1}(f,4),Sonuc{s,1}(f,5),Sonuc{s,1}(f,6))*[1;0;0])';
Sonuc{s,4}(f,1:3)=rot_est;

Sonuc{s,4}(f,4)=acos(dot(rot_real,rot_est))*180/pi;

end
Sonuc{s,3}=mean(Sonuc{s,2}(:,4));
Sonuc{s,5}=mean(Sonuc{s,4}(:,4));
% Sonuc{s,6}=std(Sonuc{s,2}(:,4));
% Sonuc{s,7}=std(Sonuc{s,4}(:,4));
% Sonuc{s,8}=min(Sonuc{s,2}(:,4));
% Sonuc{s,9}=min(Sonuc{s,4}(:,4));
% Sonuc{s,10}=max(Sonuc{s,2}(:,4));
% Sonuc{s,11}=max(Sonuc{s,4}(:,4));
end

% konum_hatasi=mean(cell2mat(Sonuc(:,3))); %milimetre
% aci_hatasi=mean(cell2mat(Sonuc(:,5)));   %derece

s1=cell2mat(Sonuc(:,3));
s2=find(s1<100);
konum_hatasi=mean(s1(s2));

s3=cell2mat(Sonuc(:,5));
s4=find(s3<100);
aci_hatasi=mean(s3(s4));

 fprintf(' Konum:  %.4f  Açı:  %.4f  Süre:  %.4f\n',konum_hatasi,aci_hatasi,time_mean)
% save('sonuc');

% save('sinirsiz_100run_30pop_D7_hata20dB.mat','Sonuc','time')





