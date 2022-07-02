addpath(genpath('../../DNGR'));


Kstep = 3;
alpha = 0.98;

dim = 732;
% dim = 1915;
dataD11 = load('../../fusion/fu_ACdrug.mat');
dataD1 = dataD11.Wd;
% data1=load('../../fusion/fu_ACthreeprotein.mat');
% data3=data1.Wp;
% data41 = load('../../data/proteinsim2network.txt');
% data51 = load('../../data/proteinsim3network.txt');
% data61 = load('../../data/proteinsim4network.txt');
% data4 = data41 .* 0.2585;
% data5 = data51 .* 0.2585;
% data6 = data61 .* 0.2585;


%[m,n]=size(data2);

BuildNets;                          %Build Nerual Networks

%Run DNGR Algorithm
rep_drug = DNGR(dataD1, sae, opts, nnsize, Kstep, alpha);
% rep_protein123 = DNGR(data3, sae, opts, nnsize, Kstep, alpha);
% rep_protein4 = DNGR(data4, sae, opts, nnsize, Kstep, alpha);
% rep_protein5 = DNGR(data5, sae, opts, nnsize, Kstep, alpha);
% rep_protein6 = DNGR(data6, sae, opts, nnsize, Kstep, alpha);

save('../../feature/rep_drug.mat','rep_drug'); 
% save('../../feature/rep_protein123.mat','rep_protein123'); 
% save('../../feature/rep_protein4.mat','rep_protein4'); 
% save('../../feature/rep_protein5.mat','rep_protein5'); 
% save('../../feature/rep_protein6.mat','rep_protein6');