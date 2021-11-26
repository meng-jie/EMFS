addpath(genpath('../../DNGR'));


Kstep = 3;
alpha = 0.98;

% dim = 732;
dim = 1915;

% dataD11 = load('../../fusion/fu_drug.mat');
% dataD1 = dataD11.Wd;
dataP11 = load('../../fusion/three_type.mat');
dataP1 = dataP11.Wp;
dataP2 = load('../../data/proteinsim1network.txt');
dataP3 = load('../../data/proteinsim2network.txt');
dataP4 = load('../../data/proteinsim3network.txt');

BuildNets;                          %Build Nerual Networks

%Run DNGR Algorithm
% rep_drug = DNGR(dataD1, sae, opts, nnsize, Kstep, alpha);
rep_protein1 = DNGR(dataP1, sae, opts, nnsize, Kstep, alpha);
rep_protein2 = DNGR(dataP2, sae, opts, nnsize, Kstep, alpha);
rep_protein3 = DNGR(dataP3, sae, opts, nnsize, Kstep, alpha);
rep_protein4 = DNGR(dataP4, sae, opts, nnsize, Kstep, alpha);

% save('../../feature/rep_drug.mat','rep_drug'); 
save('../../feature/rep_protein1.mat','rep_protein1');
save('../../feature/rep_protein2.mat','rep_protein2');
save('../../feature/rep_protein3.mat','rep_protein3');
save('../../feature/rep_protein4.mat','rep_protein4');
