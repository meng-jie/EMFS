addpath(genpath('../../DNGR'));


Kstep = 3;
alpha = 0.98;

dim = 732;
%dim = 1915;

%d1,3,4,5;p1,2,3
dataD1 = load('../../data/drugdrug.txt');
dataD3 = load('../../data/drugsim1network.txt');
dataD4 = load('../../data/drugsim2network.txt');
dataD5 = load('../../data/drugsim3network.txt');
dataP1 = load('../../data/proteinprotein.txt');
dataP2 = load('../../simNet/Sim_proteinDisease.txt');
dataP3 = load('../../data/proteinsim1network.txt');

%fusion
%dataD222 = load('../../fusion/fu_drug_second.mat');
%dataD2 = dataD222.Wd;
%dataD66 = load('../../fusion/fu_drug_sixth.mat');
%dataD6 = dataD66.Wd;

%before pingjie of second
%dataD21 = load('../../simNet/Sim_drugDisease.txt');
dataD22 = load('../../simNet/Sim_drugsideEffect.txt');

%before pingjie of sixth
%dataD7 = load('../../data/drugsim4network.txt');
%dataD8 = load('../../data/drugsim5network.txt');
%dataD9 = load('../../data/drugsim6network.txt');

%fusion
%dataP44 = load('../../fusion/fu_protein_fourth.mat');
%dataP4 = dataP44.Wp;

%before pingjie of fourth
%dataP5 = load('../../data/proteinsim2network.txt');
%dataP6 = load('../../data/proteinsim3network.txt');
%dataP7 = load('../../data/proteinsim4network.txt');

%[m,n]=size(data2);

BuildNets;                          %Build Nerual Networks

%Run DNGR Algorithm
%rep_drug2 = DNGR(dataD2, sae, opts, nnsize, Kstep, alpha);
%rep_drug21 = DNGR(dataD21, sae, opts, nnsize, Kstep, alpha);
rep_drug22 = DNGR(dataD22, sae, opts, nnsize, Kstep, alpha);
%rep_drug6 = DNGR(dataD6, sae, opts, nnsize, Kstep, alpha);
%rep_drug7 = DNGR(dataD61, sae, opts, nnsize, Kstep, alpha);
%rep_drug8 = DNGR(dataD62, sae, opts, nnsize, Kstep, alpha);
%rep_drug9 = DNGR(dataD63, sae, opts, nnsize, Kstep, alpha);

%rep_protein4 = DNGR(dataP4, sae, opts, nnsize, Kstep, alpha);
%rep_protein5 = DNGR(dataP41, sae, opts, nnsize, Kstep, alpha);
%rep_protein6 = DNGR(dataP42, sae, opts, nnsize, Kstep, alpha);
%rep_protein7 = DNGR(dataP43, sae, opts, nnsize, Kstep, alpha);

 
%save('../../feature/rep_drug2.mat','rep_drug2'); 
%save('../../feature/rep_drug21.mat','rep_drug21'); 
save('../../feature/rep_drug22.mat','rep_drug22');
%save('../../feature/rep_drug6.mat','rep_drug6'); 
%save('../../feature/rep_drug7.mat','rep_drug7'); 
%save('../../feature/rep_drug8.mat','rep_drug8'); 
%save('../../feature/rep_drug9.mat','rep_drug9'); 

%save('../../feature/rep_protein4.mat','rep_protein4');
%save('../../feature/rep_protein5.mat','rep_protein5');
%save('../../feature/rep_protein6.mat','rep_protein6');
%save('../../feature/rep_protein7.mat','rep_protein7');
