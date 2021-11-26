clear
close all
%%%Load the data
% WFirstdrug1 = load('../WCNetwork/WFirstdrug.mat');
% WSeconddrug11 = load('../WCNetwork/WSeconddrug1.mat');
% WSeconddrug21 = load('../WCNetwork/WSeconddrug2.mat');
WThirddrug1 = load('../WCNetwork/WThirddrug.mat');
WFourthdrug1 = load('../WCNetwork/WFourthdrug.mat');
WFifthdrug1 = load('../WCNetwork/WFifthdrug.mat');
WSixthdrug11 = load('../WCNetwork/WSixthdrug1.mat');
WSixthdrug21 = load('../WCNetwork/WSixthdrug2.mat');
WSixthdrug31 = load('../WCNetwork/WSixthdrug3.mat');

% WFirstdrug = WFirstdrug1.Firstdrug;
% WSeconddrug1 = WSeconddrug11.Seconddrug1;
% WSeconddrug2 = WSeconddrug21.Seconddrug2;
WThirddrug = WThirddrug1.Thirddrug;
WFourthdrug = WFourthdrug1.Fourthdrug;
WFifthdrug = WFifthdrug1.Fifthdrug;
WSixthdrug1 = WSixthdrug11.Sixthdrug1;
WSixthdrug2 = WSixthdrug21.Sixthdrug2;
WSixthdrug3 = WSixthdrug31.Sixthdrug3;

%%%First, set all the parameters.
K = 20;%number of neighbors, usually (10~30)
alpha = 0.5; %hyperparameter, usually (0.3~0.8)
T = 20; %Number of Iterations, usually (10~20)

%If the data are all continuous values, we recommend the users to perform standard normalization before using SNF, though it is optional depending on the data the users want to use.
% WFirstdrug = Standard_Normalization(WFirstdrug);
% WSeconddrug1 = Standard_Normalization(WSeconddrug1);
% WSeconddrug2 = Standard_Normalization(WSeconddrug2);
WThirddrug = Standard_Normalization(WThirddrug);
WFourthdrug = Standard_Normalization(WFourthdrug);
WFifthdrug = Standard_Normalization(WFifthdrug);
WSixthdrug1 = Standard_Normalization(WSixthdrug1);
WSixthdrug2 = Standard_Normalization(WSixthdrug2);
WSixthdrug3 = Standard_Normalization(WSixthdrug3);


%%%Calculate the pair-wise distance; If the data is continuous, we recommend to use the function "dist2" as follows;
%if the data is discrete, we recommend the users to use chi-square distance
% Dist1 = dist2(WFirstdrug,WFirstdrug);
% Dist21 = dist2(WSeconddrug1,WSeconddrug1);
% Dist22 = dist2(WSeconddrug2,WSeconddrug2);
Dist3 = dist2(WThirddrug,WThirddrug);
Dist4 = dist2(WFourthdrug,WFourthdrug);
Dist5 = dist2(WFifthdrug,WFifthdrug);
Dist61 = dist2(WSixthdrug1,WSixthdrug1);
Dist62 = dist2(WSixthdrug2,WSixthdrug2);
Dist63 = dist2(WSixthdrug3,WSixthdrug3);

%%%next, construct similarity graphs
% W1 = affinityMatrix(Dist1, K, alpha);
% W21 = affinityMatrix(Dist21, K, alpha);
% W22 = affinityMatrix(Dist22, K, alpha);
W3 = affinityMatrix(Dist3, K, alpha);
W4 = affinityMatrix(Dist4, K, alpha);
W5 = affinityMatrix(Dist5, K, alpha);
W61 = affinityMatrix(Dist61, K, alpha);
W62 = affinityMatrix(Dist62, K, alpha);
W63 = affinityMatrix(Dist63, K, alpha);


% then the overall matrix can be computed by similarity network fusion(SNF):
Wd = SNF({W3,W4,W5,W61,W62,W63},K,T);

save('../fusion/fu_Cdrug.mat','Wd');