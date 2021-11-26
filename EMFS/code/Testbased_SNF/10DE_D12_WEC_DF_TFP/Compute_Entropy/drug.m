clear
close all
% %%%load the data
% Firstdrug = load('../data/drugdrug.txt');
% Seconddrug1 = load('../simNet/Sim_drugDisease.txt');
% Seconddrug2 = load('../simNet/Sim_drugsideEffect.txt');
Thirddrug = load('../data/drugsim1network.txt');
Fourthdrug = load('../data/drugsim2network.txt');
Fifthdrug = load('../data/drugsim3network.txt');
Sixthdrug1 = load('../data/drugsim4network.txt');
Sixthdrug2 = load('../data/drugsim5network.txt');
Sixthdrug3 = load('../data/drugsim6network.txt');

% E1 = eachE(Firstdrug);    % first
% E2 = eachE(Seconddrug1);
% E3 = eachE(Seconddrug2);   %second
E4 = eachE(Thirddrug);  %third
E5 = eachE(Fourthdrug);  %fourth
E6 = eachE(Fifthdrug);  %fifth
E7 = eachE(Sixthdrug1);
E8 = eachE(Sixthdrug2);
E9 = eachE(Sixthdrug3);  %sixth

% Wf = E1;
% Wse = E2 + E3;
Wt = E4;
Wfo = E5;
Wfi = E6;
Wsi = E7 + E8 + E9;

sumW = Wt + Wfo + Wfi + Wsi;
% Wf = Wf ./ sumW;
% Wse = Wse ./ sumW;
Wt = Wt ./ sumW;
Wfo = Wfo ./ sumW;
Wfi = Wfi ./ sumW;
Wsi = Wsi ./ sumW;

% Firstdrug = Firstdrug .* Wf;
% Seconddrug1 = Seconddrug1 .* Wse;
% Seconddrug2 = Seconddrug2 .* Wse;
Thirddrug = Thirddrug .* Wt;
Fourthdrug = Fourthdrug .* Wfo;
Fifthdrug = Fifthdrug .* Wfi;
Sixthdrug1 = Sixthdrug1 .* Wsi;
Sixthdrug2 = Sixthdrug2 .* Wsi;
Sixthdrug3 = Sixthdrug3 .* Wsi;

% save("../WCNetwork/WFirstdrug.mat",'Firstdrug');
% save("../WCNetwork/WSeconddrug1.mat",'Seconddrug1');
% save("../WCNetwork/WSeconddrug2.mat",'Seconddrug2');
save("../WCNetwork/WThirddrug.mat",'Thirddrug');
save("../WCNetwork/WFourthdrug.mat",'Fourthdrug');
save("../WCNetwork/WFifthdrug.mat",'Fifthdrug');
save("../WCNetwork/WSixthdrug1.mat",'Sixthdrug1');
save("../WCNetwork/WSixthdrug2.mat",'Sixthdrug2');
save("../WCNetwork/WSixthdrug3.mat",'Sixthdrug3');
