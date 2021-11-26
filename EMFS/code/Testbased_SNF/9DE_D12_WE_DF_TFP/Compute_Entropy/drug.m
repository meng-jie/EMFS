clear
close all
%%%load the data
drugsim1network = load('../data/drugsim1network.txt');
drugsim2network = load('../data/drugsim2network.txt');
drugsim3network = load('../data/drugsim3network.txt');
drugsim4network = load('../data/drugsim4network.txt');
drugsim5network = load('../data/drugsim5network.txt');
drugsim6network = load('../data/drugsim6network.txt');

E4 = eachE(drugsim1network);
E5 = eachE(drugsim2network);
E6 = eachE(drugsim3network);
E7 = eachE(drugsim4network);
E8 = eachE(drugsim5network);
E9 = eachE(drugsim6network);

sumE = E4+E5+E6+E7+E8+E9;
W4 = E4 ./ sumE;
W5 = E5 ./ sumE;
W6 = E6 ./ sumE;
W7 = E7 ./ sumE;
W8 = E8 ./ sumE;
W9 = E9 ./ sumE;

drugsim1network = drugsim1network .* W4;
drugsim2network = drugsim2network .* W5;
drugsim3network = drugsim3network .* W6;
drugsim4network = drugsim4network .* W7;
drugsim5network = drugsim5network .* W8;
drugsim6network = drugsim6network .* W9;

save("../WNetwork/Wdrugsim1network.mat",'drugsim1network');
save("../WNetwork/Wdrugsim2network.mat",'drugsim2network');
save("../WNetwork/Wdrugsim3network.mat",'drugsim3network');
save("../WNetwork/Wdrugsim4network.mat",'drugsim4network');
save("../WNetwork/Wdrugsim5network.mat",'drugsim5network');
save("../WNetwork/Wdrugsim6network.mat",'drugsim6network');