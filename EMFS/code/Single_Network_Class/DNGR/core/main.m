addpath(genpath('../../DNGR'));


Kstep = 3;
alpha = 0.98;

dim = 732;
%dim = 1915;

%dataD1 = load('../../data/drugdrug.txt');
%dataD3 = load('../../data/drugsim1network.txt');
%dataD4 = load('../../data/drugsim2network.txt');
%dataD5 = load('../../data/drugsim3network.txt');


%dataP1 = load('../../data/proteinprotein.txt');
%dataP2 = load('../../simNet/Sim_proteinDisease.txt');
%dataP3 = load('../../data/proteinsim1network.txt');

%[m,n]=size(data2);

BuildNets;                          %Build Nerual Networks

%Run DNGR Algorithm
%rep_drug1 = DNGR(dataD1, sae, opts, nnsize, Kstep, alpha);
%rep_drug3 = DNGR(dataD3, sae, opts, nnsize, Kstep, alpha);
%rep_drug4 = DNGR(dataD4, sae, opts, nnsize, Kstep, alpha);
%rep_drug5 = DNGR(dataD5, sae, opts, nnsize, Kstep, alpha);

%rep_protein1 = DNGR(dataP1, sae, opts, nnsize, Kstep, alpha);
%rep_protein2 = DNGR(dataP2, sae, opts, nnsize, Kstep, alpha);
%rep_protein3 = DNGR(dataP3, sae, opts, nnsize, Kstep, alpha);


%save('../../feature/rep_drug1.mat','rep_drug1');
%save('../../feature/rep_drug3.mat','rep_drug3'); 
%save('../../feature/rep_drug4.mat','rep_drug4'); 
%save('../../feature/rep_drug5.mat','rep_drug5');

%save('../../feature/rep_protein1.mat','rep_protein1');
%save('../../feature/rep_protein2.mat','rep_protein2');
%save('../../feature/rep_protein3.mat','rep_protein3');
