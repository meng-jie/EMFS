clear
close all
%%%Load the data
proteinsim2network = load('../data/proteinsim2network.txt');
proteinsim3network = load('../data/proteinsim3network.txt');
proteinsim4network = load('../data/proteinsim4network.txt');

%%%First, set all the parameters.
K = 20;%number of neighbors, usually (10~30)
alpha = 0.5; %hyperparameter, usually (0.3~0.8)
T = 20; %Number of Iterations, usually (10~20)

%If the data are all continuous values, we recommend the users to perform standard normalization before using SNF, though it is optional depending on the data the users want to use.
Proteinsim2network = Standard_Normalization(proteinsim2network);
Proteinsim3network = Standard_Normalization(proteinsim3network);
Proteinsim4network = Standard_Normalization(proteinsim4network);


%%%Calculate the pair-wise distance; If the data is continuous, we recommend to use the function "dist2" as follows;
%if the data is discrete, we recommend the users to use chi-square distance

Dist1 = dist2(Proteinsim2network,Proteinsim2network);
Dist2 = dist2(Proteinsim3network,Proteinsim3network);
Dist3 = dist2(Proteinsim4network,Proteinsim4network);


%%%next, construct similarity graphs

W1 = affinityMatrix(Dist1, K, alpha);
W2 = affinityMatrix(Dist2, K, alpha);
W3 = affinityMatrix(Dist3, K, alpha);


% then the overall matrix can be computed by similarity network fusion(SNF):
Wp = SNF({W1,W2,W3},K,T);

save('../fusion/fu_protein_fourth.mat','Wp');