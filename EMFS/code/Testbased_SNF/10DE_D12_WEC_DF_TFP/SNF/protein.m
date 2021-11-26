clear
close all
%%%Load the data
WFirstprotein1 = load('../WCNetwork/WFirstprotein.mat');
WSecondprotein1 = load('../WCNetwork/WSecondprotein.mat');
WThirdprotein1 = load('../WCNetwork/WThirdprotein.mat');

WFirstprotein = WFirstprotein1.Firstprotein;
WSecondprotein = WSecondprotein1.Secondprotein;
WThirdprotein = WThirdprotein1.Thirdprotein;

%%%First, set all the parameters.
K = 20;%number of neighbors, usually (10~30)
alpha = 0.5; %hyperparameter, usually (0.3~0.8)
T = 20; %Number of Iterations, usually (10~20)

%If the data are all continuous values, we recommend the users to perform standard normalization before using SNF, though it is optional depending on the data the users want to use.
WFirstprotein = Standard_Normalization(WFirstprotein);
WSecondprotein = Standard_Normalization(WSecondprotein);
WThirdprotein = Standard_Normalization(WThirdprotein);


%%%Calculate the pair-wise distance; If the data is continuous, we recommend to use the function "dist2" as follows;
%if the data is discrete, we recommend the users to use chi-square distance

Dist1 = dist2(WFirstprotein,WFirstprotein);
Dist2 = dist2(WSecondprotein,WSecondprotein);
Dist3 = dist2(WThirdprotein,WThirdprotein);


%%%next, construct similarity graphs

W1 = affinityMatrix(Dist1, K, alpha);
W2 = affinityMatrix(Dist2, K, alpha);
W3 = affinityMatrix(Dist3, K, alpha);


% then the overall matrix can be computed by similarity network fusion(SNF):
Wp = SNF({W1,W2,W3},K,T);

save('../fusion/fu_CThreeprotein.mat','Wp');
