clear
close all
%%%Load the data
Firstdrug = load('../data/drugdrug.txt');
Seconddrug1 = load('../simNet/Sim_drugDisease.txt');
Seconddrug2 = load('../simNet/Sim_drugsideEffect.txt');
Thirddrug = load('../data/drugsim1network.txt');
Fourthdrug = load('../data/drugsim2network.txt');
Fifthdrug = load('../data/drugsim3network.txt');
Sixthdrug1 = load('../data/drugsim4network.txt');
Sixthdrug2 = load('../data/drugsim5network.txt');
Sixthdrug3 = load('../data/drugsim6network.txt');


[sd11, sd12, sd13, sd14, sd15, sd16] = classofsixsoftmax(0.497162, 0.540941, 0.711259, 0.759122, 0.656511, 0.759609);
[sd21, sd22, sd23, sd24, sd25, sd26] = classofsixsoftmax(0.498252, 0.532585, 0.701535, 0.758729, 0.658559, 0.760477);
[sd31, sd32, sd33, sd34, sd35, sd36] = classofsixsoftmax(0.775075, 0.771831, 0.829, 0.868441, 0.792605, 0.868358);
[sd41, sd42, sd43, sd44, sd45, sd46] = classofsixsoftmax(0.83284, 0.828771, 0.903138, 0.930157, 0.881836, 0.921753);


sd111 = (sd11 + sd21 + sd31 + sd41) ./ 4;
sd222 = (sd12 + sd22 + sd32 + sd42) ./ 4;
sd333 = (sd13 + sd23 + sd33 + sd43) ./ 4;
sd444 = (sd14 + sd24 + sd34 + sd44) ./ 4;
sd555 = (sd15 + sd25 + sd35 + sd45) ./ 4;
sd666 = (sd16 + sd26 + sd36 + sd46) ./ 4;

[sd1, sd2, sd3, sd4, sd5, sd6] = classofsixsoftmax(sd111, sd222, sd333, sd444, sd555, sd666);

WFirstdrug = Firstdrug .* sd1;
WSeconddrug1 = Seconddrug1 .* sd2;
WSeconddrug2 = Seconddrug2 .* sd2;
WThirddrug = Thirddrug .* sd3;
WFourthdrug = Fourthdrug .* sd4;
WFifthdrug = Fifthdrug .* sd5;
WSixthdrug1 = Sixthdrug1 .* sd6;
WSixthdrug2 = Sixthdrug2 .* sd6;
WSixthdrug3 = Sixthdrug3 .* sd6;

%%%First, set all the parameters
K = 20;%number of neighbors, usually (10~30)
alpha = 0.5; %hyperparameter, usually (0.3~0.8)
T = 20; %Number of Iterations, usually (10~20)

%If the data are all continuous values, we recommend the users to perform standard normalization before using SNF, though it is optional depending on the data the users want to use.
WFirstdrug = Standard_Normalization(WFirstdrug);
WSeconddrug1 = Standard_Normalization(WSeconddrug1);
WSeconddrug2 = Standard_Normalization(WSeconddrug2);
WThirddrug = Standard_Normalization(WThirddrug);
WFourthdrug = Standard_Normalization(WFourthdrug);
WFifthdrug = Standard_Normalization(WFifthdrug);
WSixthdrug1 = Standard_Normalization(WSixthdrug1);
WSixthdrug2 = Standard_Normalization(WSixthdrug2);
WSixthdrug3 = Standard_Normalization(WSixthdrug3);


%%%Calculate the pair-wise distance; If the data is continuous, we recommend to use the function "dist2" as follows;
%if the data is discrete, we recommend the users to use chi-square distance
Dist1 = dist2(WFirstdrug,WFirstdrug);
Dist21 = dist2(WSeconddrug1,WSeconddrug1);
Dist22 = dist2(WSeconddrug2,WSeconddrug2);
Dist3 = dist2(WThirddrug,WThirddrug);
Dist4 = dist2(WFourthdrug,WFourthdrug);
Dist5 = dist2(WFifthdrug,WFifthdrug);
Dist61 = dist2(WSixthdrug1,WSixthdrug1);
Dist62 = dist2(WSixthdrug2,WSixthdrug2);
Dist63 = dist2(WSixthdrug3,WSixthdrug3);

%%%next, construct similarity graphs
W1 = affinityMatrix(Dist1, K, alpha);
W21 = affinityMatrix(Dist21, K, alpha);
W22 = affinityMatrix(Dist22, K, alpha);
W3 = affinityMatrix(Dist3, K, alpha);
W4 = affinityMatrix(Dist4, K, alpha);
W5 = affinityMatrix(Dist5, K, alpha);
W61 = affinityMatrix(Dist61, K, alpha);
W62 = affinityMatrix(Dist62, K, alpha);
W63 = affinityMatrix(Dist63, K, alpha);


% then the overall matrix can be computed by similarity network fusion(SNF):
Wd = SNF({W1,W21,W22,W3,W4,W5,W61,W62,W63},K,T);

save('../fusion/fu_ACdrug.mat','Wd');
