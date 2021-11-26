clear
close all
%%%load the data
proteinprotein = load('../data/proteinprotein.txt');
proteinDisease = load('../simNet/Sim_proteinDisease.txt');
proteinsim1network = load('../data/proteinsim1network.txt');
proteinsim2network = load('../data/proteinsim2network.txt');
proteinsim3network = load('../data/proteinsim3network.txt');
proteinsim4network = load('../data/proteinsim4network.txt');

E1 = eachE(proteinprotein);
E2 = eachE(proteinDisease);
E3 = eachE(proteinsim1network);
E4 = eachE(proteinsim2network);
E5 = eachE(proteinsim3network);
E6 = eachE(proteinsim4network);

sumE = E1+E2+E3+E4+E5+E6;
W1 = E1 ./ sumE;
W2 = E2 ./ sumE;
W3 = E3 ./ sumE;
W4 = E4 ./ sumE;
W5 = E5 ./ sumE;
W6 = E6 ./ sumE;

proteinprotein = proteinprotein .* W1;
proteinDisease = proteinDisease .* W2;
proteinsim1network = proteinsim1network .* W3;
proteinsim2network = proteinsim2network .* W4;
proteinsim3network = proteinsim3network .* W5;
proteinsim4network = proteinsim4network .* W6;

save("../WNetwork/Wproteinprotein.mat",'proteinprotein');
save("../WNetwork/WproteinDisease.mat",'proteinDisease');
save("../WNetwork/Wproteinsim1network.mat",'proteinsim1network');
save("../WNetwork/Wproteinsim2network.mat",'proteinsim2network');
save("../WNetwork/Wproteinsim3network.mat",'proteinsim3network');
save("../WNetwork/Wproteinsim4network.mat",'proteinsim4network');