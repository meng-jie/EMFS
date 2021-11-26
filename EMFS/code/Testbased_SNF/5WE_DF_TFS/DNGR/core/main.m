addpath(genpath('../../DNGR'));


Kstep = 3;
alpha = 0.98;

dim = 732;
% dim = 1915;
dataD11 = load('../../fusion/fu_drug.mat');
dataD1 = dataD11.Wd;
% data31=load('../../fusion/fu_threeprotein.mat');
% data3=data31.Wp;
% data41 = load('../../WNetwork/Wproteinsim2network.mat');
% data51 = load('../../WNetwork/Wproteinsim3network.mat');
% data61 = load('../../WNetwork/Wproteinsim4network.mat');
% data4 = data41.proteinsim2network;
% data5 = data51.proteinsim3network;
% data6 = data61.proteinsim4network;


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
