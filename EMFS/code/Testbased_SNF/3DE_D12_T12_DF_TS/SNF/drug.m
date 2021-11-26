clear
close all
%%%Load the data
%drug-sixth
% drugsim4network = load('../data/drugsim4network.txt');
% drugsim5network = load('../data/drugsim5network.txt');
% drugsim6network = load('../data/drugsim6network.txt');
%third\fourth\fifth\sixth
drugsim1network = load('../data/drugsim1network.txt');
drugsim2network = load('../data/drugsim2network.txt');
drugsim3network = load('../data/drugsim3network.txt');
drug66 = load('../fusion/fu_drug6.mat');
drug6 = drug66.Wd6;

%%%First, set all the parameters.
K = 20;%number of neighbors, usually (10~30)
alpha = 0.5; %hyperparameter, usually (0.3~0.8)
T = 20; %Number of Iterations, usually (10~20)

%If the data are all continuous values, we recommend the users to perform standard normalization before using SNF, though it is optional depending on the data the users want to use.
% Drugsim4network = Standard_Normalization(drugsim4network);
% Drugsim5network = Standard_Normalization(drugsim5network);
% Drugsim6network = Standard_Normalization(drugsim6network);
Drugsim1network = Standard_Normalization(drugsim1network);
Drugsim2network = Standard_Normalization(drugsim2network);
Drugsim3network = Standard_Normalization(drugsim3network);
Drug6 = Standard_Normalization(drug6);

%%%Calculate the pair-wise distance; If the data is continuous, we recommend to use the function "dist2" as follows;
%if the data is discrete, we recommend the users to use chi-square distance
% Dist7 = dist2(Drugsim4network,Drugsim4network);
% Dist8 = dist2(Drugsim5network,Drugsim5network);
% Dist9 = dist2(Drugsim6network,Drugsim6network);
Dist1 = dist2(Drugsim1network,Drugsim1network);
Dist2 = dist2(Drugsim2network,Drugsim2network);
Dist3 = dist2(Drugsim3network,Drugsim3network);
Dist4 = dist2(Drug6,Drug6);

%%%next, construct similarity graphs
% W7 = affinityMatrix(Dist7, K, alpha);
% W8 = affinityMatrix(Dist8, K, alpha);
% W9 = affinityMatrix(Dist9, K, alpha);
W1 = affinityMatrix(Dist1, K, alpha);
W2 = affinityMatrix(Dist2, K, alpha);
W3 = affinityMatrix(Dist3, K, alpha);
W4 = affinityMatrix(Dist4, K, alpha);

% then the overall matrix can be computed by similarity network fusion(SNF):
%Wd6 = SNF({W7,W8,W9},K,T);
Wd = SNF({W1,W2,W3,W4});

%save('../fusion/fu_drug6.mat','Wd6');
save('../fusion/fu_drug.mat','Wd');