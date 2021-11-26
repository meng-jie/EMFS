clear
close all
%%%Load the data
drugdrug1 = load('../WNetwork/Wdrugdrug.mat');
drugDisease1 = load('../WNetwork/WdrugDisease.mat');
drugsideEffect1 = load('../WNetwork/WdrugsideEffect.mat');
drugsim1network1 = load('../WNetwork/Wdrugsim1network.mat');
drugsim2network1 = load('../WNetwork/Wdrugsim2network.mat');
drugsim3network1 = load('../WNetwork/Wdrugsim3network.mat');
drugsim4network1 = load('../WNetwork/Wdrugsim4network.mat');
drugsim5network1 = load('../WNetwork/Wdrugsim5network.mat');
drugsim6network1 = load('../WNetwork/Wdrugsim6network.mat');


drugdrug = drugdrug1.drugdrug;
drugDisease = drugDisease1.drugDisease;
drugsideEffect = drugsideEffect1.drugsideEffect;
drugsim1network = drugsim1network1.drugsim1network;
drugsim2network = drugsim2network1.drugsim2network;
drugsim3network = drugsim3network1.drugsim3network;
drugsim4network = drugsim4network1.drugsim4network;
drugsim5network = drugsim5network1.drugsim5network;
drugsim6network = drugsim6network1.drugsim6network;

%%%First, set all the parameters.
K = 20;%number of neighbors, usually (10~30)
alpha = 0.5; %hyperparameter, usually (0.3~0.8)
T = 20; %Number of Iterations, usually (10~20)

%If the data are all continuous values, we recommend the users to perform standard normalization before using SNF, though it is optional depending on the data the users want to use.
Drugdrug = Standard_Normalization(drugdrug);
Drugdisease = Standard_Normalization(drugDisease);
DrugsideEffect = Standard_Normalization(drugsideEffect);
Drugsim1network = Standard_Normalization(drugsim1network);
Drugsim2network = Standard_Normalization(drugsim2network);
Drugsim3network = Standard_Normalization(drugsim3network);
Drugsim4network = Standard_Normalization(drugsim4network);
Drugsim5network = Standard_Normalization(drugsim5network);
Drugsim6network = Standard_Normalization(drugsim6network);


%%%Calculate the pair-wise distance; If the data is continuous, we recommend to use the function "dist2" as follows;
%if the data is discrete, we recommend the users to use chi-square distance
Dist1 = dist2(Drugdrug,Drugdrug);
Dist2 = dist2(Drugdisease,Drugdisease);
Dist3 = dist2(DrugsideEffect,DrugsideEffect);
Dist4 = dist2(Drugsim1network,Drugsim1network);
Dist5 = dist2(Drugsim2network,Drugsim2network);
Dist6 = dist2(Drugsim3network,Drugsim3network);
Dist7 = dist2(Drugsim4network,Drugsim4network);
Dist8 = dist2(Drugsim5network,Drugsim5network);
Dist9 = dist2(Drugsim6network,Drugsim6network);

%%%next, construct similarity graphs
W1 = affinityMatrix(Dist1, K, alpha);
W2 = affinityMatrix(Dist2, K, alpha);
W3 = affinityMatrix(Dist3, K, alpha);
W4 = affinityMatrix(Dist4, K, alpha);
W5 = affinityMatrix(Dist5, K, alpha);
W6 = affinityMatrix(Dist6, K, alpha);
W7 = affinityMatrix(Dist7, K, alpha);
W8 = affinityMatrix(Dist8, K, alpha);
W9 = affinityMatrix(Dist9, K, alpha);


% then the overall matrix can be computed by similarity network fusion(SNF):
Wd = SNF({W1,W2,W3,W4,W5,W6,W7,W8,W9},K,T);

save('../fusion/fu_drug.mat','Wd');