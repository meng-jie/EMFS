addpath(genpath('../../DNGR'));


Kstep = 3;
alpha = 0.98;

%dim = 732;
dim = 1915;
%data0=load('../../fusion/fu_drug.mat');
%data2=data0.Wd;
data31=load('../../fusion/fu_threeprotein.mat');
data3=data31.Wp;
data4 = load('../../data/proteinsim2network.txt');
data5 = load('../../data/proteinsim3network.txt');
data6 = load('../../data/proteinsim4network.txt');


%[m,n]=size(data2);

BuildNets;                          %Build Nerual Networks

%Run DNGR Algorithm
%rep_drug = DNGR(data2, sae, opts, nnsize, Kstep, alpha);
rep_protein123 = DNGR(data3, sae, opts, nnsize, Kstep, alpha);
rep_protein4 = DNGR(data4, sae, opts, nnsize, Kstep, alpha);
rep_protein5 = DNGR(data5, sae, opts, nnsize, Kstep, alpha);
rep_protein6 = DNGR(data6, sae, opts, nnsize, Kstep, alpha);

%save('../../feature/rep_drug.mat','rep_drug'); 
save('../../feature/rep_protein123.mat','rep_protein123'); 
save('../../feature/rep_protein4.mat','rep_protein4'); 
save('../../feature/rep_protein5.mat','rep_protein5'); 
save('../../feature/rep_protein6.mat','rep_protein6');
