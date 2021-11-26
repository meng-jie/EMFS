clear
close all
%%%Load the data
Firstprotein = load('../data/proteinprotein.txt');
Secondprotein = load('../simNet/Sim_proteinDisease.txt');
Thirdprotein = load('../data/proteinsim1network.txt');


[sp11, sp21, sp31, sp41] = classoffoursoftmax(0.497162, 0.498252, 0.775075, 0.83284);
[sp12, sp22, sp32, sp42] = classoffoursoftmax(0.540941, 0.532585, 0.771831, 0.828771);
[sp13, sp23, sp33, sp43] = classoffoursoftmax(0.711259, 0.701535, 0.829, 0.903138);
[sp14, sp24, sp34, sp44] = classoffoursoftmax(0.759122, 0.758729, 0.868441, 0.930157);
[sp15, sp25, sp35, sp45] = classoffoursoftmax(0.656511, 0.658559, 0.792605, 0.881836);
[sp16, sp26, sp36, sp46] = classoffoursoftmax(0.759609, 0.760477, 0.868358, 0.921753);

sp111 = (sp11 + sp12 + sp13 + sp14 + sp15 + sp16) ./ 6;
sp222 = (sp21 + sp22 + sp23 + sp24 + sp25 + sp26) ./ 6;
sp333 = (sp31 + sp32 + sp33 + sp34 + sp35 + sp36) ./ 6;
sp444 = (sp41 + sp42 + sp43 + sp44 + sp45 + sp46) ./ 6;

[sp1, sp2, sp3, sp4] = classoffoursoftmax(sp111, sp222, sp333, sp444);

WFirstprotein = Firstprotein .* sp1;
WSecondprotein = Secondprotein .* sp2;
WThirdprotein = Thirdprotein .* sp3;

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

save('../fusion/fu_ACthreeprotein.mat','Wp');
