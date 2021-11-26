clear
close all
%%%load the data
Firstprotein = load('../data/proteinprotein.txt');
Secondprotein = load('../simNet/Sim_proteinDisease.txt');
Thirdprotein = load('../data/proteinsim1network.txt');
Fourthprotein1 = load('../data/proteinsim2network.txt');
Fourthprotein2 = load('../data/proteinsim3network.txt');
Fourthprotein3 = load('../data/proteinsim4network.txt');

E1 = eachE(Firstprotein);       %first
E2 = eachE(Secondprotein);       %second
E3 = eachE(Thirdprotein);   %third
E4 = eachE(Fourthprotein1);   
E5 = eachE(Fourthprotein2);
E6 = eachE(Fourthprotein3);   %fourth

Wf = E1;
Ws = E2;
Wt = E3;
Wfo = E4 + E5 + E6;

sumW = Wf + Ws + Wt + Wfo;
Wf = Wf ./ sumW;
Ws = Ws ./ sumW;
Wt = Wt ./ sumW;
Wfo = Wfo ./ sumW;

Firstprotein = Firstprotein .* Wf;
Secondprotein = Secondprotein .* Ws;
Thirdprotein = Thirdprotein .* Wt;
Fourthprotein1 = Fourthprotein1 .* Wfo;
Fourthprotein2 = Fourthprotein2 .* Wfo;
Fourthprotein3 = Fourthprotein3 .* Wfo;

save("../WCNetwork/WFirstprotein.mat",'Firstprotein');
save("../WCNetwork/WSecondprotein.mat",'Secondprotein');
save("../WCNetwork/WThirdprotein.mat",'Thirdprotein');
save("../WCNetwork/WFourthprotein1.mat",'Fourthprotein1');
save("../WCNetwork/WFourthprotein2.mat",'Fourthprotein2');
save("../WCNetwork/WFourthprotein3.mat",'Fourthprotein3');