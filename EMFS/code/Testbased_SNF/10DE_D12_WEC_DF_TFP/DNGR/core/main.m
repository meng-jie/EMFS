addpath(genpath('../../DNGR'));


Kstep = 3;
alpha = 0.98;

dim = 732;
%dim = 1915;
dataD11=load('../../fusion/fu_Cdrug.mat');
dataD1=dataD11.Wd;
%data11=load('../../fusion/fu_CThreeprotein.mat');
%data31 = load('../../WCNetwork/WFourthprotein1.mat');
%data41 = load('../../WCNetwork/WFourthprotein2.mat');
%data51 = load('../../WCNetwork/WFourthprotein3.mat');
%data1=data11.Wp;
%data3 = data31.Fourthprotein1;
%data4 = data41.Fourthprotein2;
%data5 = data51.Fourthprotein3;

%[m,n]=size(data2);

BuildNets;                          %Build Nerual Networks

%Run DNGR Algorithm
rep_drug = DNGR(dataD1, sae, opts, nnsize, Kstep, alpha);
%rep_protein123 = DNGR(data1, sae, opts, nnsize, Kstep, alpha);
%rep_protein4 = DNGR(data3, sae, opts, nnsize, Kstep, alpha);
%rep_protein5 = DNGR(data4, sae, opts, nnsize, Kstep, alpha);
%rep_protein6 = DNGR(data5, sae, opts, nnsize, Kstep, alpha);

save('../../feature/rep_drug.mat','rep_drug'); 
%save('../../feature/rep_protein123.mat','rep_protein123'); 
%save('../../feature/rep_protein4.mat','rep_protein4'); 
%save('../../feature/rep_protein5.mat','rep_protein5'); 
%save('../../feature/rep_protein6.mat','rep_protein6');
