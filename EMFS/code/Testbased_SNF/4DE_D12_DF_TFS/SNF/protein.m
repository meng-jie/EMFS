clear
close all
%%%Load the data
proteinprotein = load('../data/proteinprotein.txt');
sim_proteinDisease = load('../simNet/Sim_proteinDisease.txt');
proteinsim1network = load('../data/proteinsim1network.txt');

%%%First, set all the parameters.
K = 20;%number of neighbors, usually (10~30)
alpha = 0.5; %hyperparameter, usually (0.3~0.8)
T = 20; %Number of Iterations, usually (10~20)

%If the data are all continuous values, we recommend the users to perform standard normalization before using SNF, though it is optional depending on the data the users want to use.
Proteinprotein = Standard_Normalization(proteinprotein);
Sim_proteinDisease = Standard_Normalization(sim_proteinDisease);
Proteinsim1network = Standard_Normalization(proteinsim1network);


%%%Calculate the pair-wise distance; If the data is continuous, we recommend to use the function "dist2" as follows;
%if the data is discrete, we recommend the users to use chi-square distance

Dist1 = dist2(Proteinprotein,Proteinprotein);
Dist2 = dist2(Sim_proteinDisease,Sim_proteinDisease);
Dist3 = dist2(Proteinsim1network,Proteinsim1network);


%%%next, construct similarity graphs

W1 = affinityMatrix(Dist1, K, alpha);
W2 = affinityMatrix(Dist2, K, alpha);
W3 = affinityMatrix(Dist3, K, alpha);


% then the overall matrix can be computed by similarity network fusion(SNF):
Wp = SNF({W1,W2,W3},K,T);

save('../fusion/three_type.mat','Wp');