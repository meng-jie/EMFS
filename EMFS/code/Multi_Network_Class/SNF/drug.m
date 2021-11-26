clear
close all
%%%Load the data
%drug-second
%drugDisease = load('../simNet/Sim_drugDisease.txt');
%drugsideEffect = load('../simNet/Sim_drugsideEffect.txt');
%drug-sixth
drugsim4network = load('../data/drugsim4network.txt');
drugsim5network = load('../data/drugsim5network.txt');
drugsim6network = load('../data/drugsim6network.txt');

%%%First, set all the parameters.
K = 20;%number of neighbors, usually (10~30)
alpha = 0.5; %hyperparameter, usually (0.3~0.8)
T = 20; %Number of Iterations, usually (10~20)

%If the data are all continuous values, we recommend the users to perform standard normalization before using SNF, though it is optional depending on the data the users want to use.
%Drugdisease = Standard_Normalization(drugDisease);
%DrugsideEffect = Standard_Normalization(drugsideEffect);
Drugsim4network = Standard_Normalization(drugsim4network);
Drugsim5network = Standard_Normalization(drugsim5network);
Drugsim6network = Standard_Normalization(drugsim6network);


%%%Calculate the pair-wise distance; If the data is continuous, we recommend to use the function "dist2" as follows;
%if the data is discrete, we recommend the users to use chi-square distance
%Dist1 = dist2(Drugdisease,Drugdisease);
%Dist2 = dist2(DrugsideEffect,DrugsideEffect);
Dist3 = dist2(Drugsim4network,Drugsim4network);
Dist4 = dist2(Drugsim5network,Drugsim5network);
Dist5 = dist2(Drugsim6network,Drugsim6network);

%%%next, construct similarity graphs
%W1 = affinityMatrix(Dist1, K, alpha);
%W2 = affinityMatrix(Dist2, K, alpha);
W3 = affinityMatrix(Dist3, K, alpha);
W4 = affinityMatrix(Dist4, K, alpha);
W5 = affinityMatrix(Dist5, K, alpha);

% then the overall matrix can be computed by similarity network fusion(SNF):
%Wd = SNF({W1,W2},K,T);
Wd = SNF({W3,W4,W5},K,T);

%save('../fusion/fu_drug_second.mat','Wd');
save('../fusion/fu_drug_sixth.mat','Wd');