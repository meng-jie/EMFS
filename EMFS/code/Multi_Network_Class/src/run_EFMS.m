clear;
clc
dim_drug = 100;
dim_prot = 400;
dim_imc = 200;

% matrix:732*1915
interaction = load('../data/drugProtein.txt');

% load embedding features
%14 combine splicing
%load('../feature/rep_drug1.mat');
%load('../feature/rep_protein5.mat');
%load('../feature/rep_protein6.mat');
%load('../feature/rep_protein7.mat');
%14 combine fusion
%load('../feature/rep_drug1.mat');
%load('../feature/rep_protein4.mat');
%34 combine splicing
load('../feature/rep_drug3.mat');
load('../feature/rep_protein5.mat');
load('../feature/rep_protein6.mat');
load('../feature/rep_protein7.mat');
%34 combine fusion
%load('../feature/rep_drug3.mat');
%load('../feature/rep_protein4.mat');
%44 combine splicing
%load('../feature/rep_drug4.mat');
%load('../feature/rep_protein5.mat');
%load('../feature/rep_protein6.mat');
%load('../feature/rep_protein7.mat');
%44 combine fusion
%load('../feature/rep_drug4.mat');
%load('../feature/rep_protein4.mat');
%54 combine splicing
%load('../feature/rep_drug5.mat');
%load('../feature/rep_protein5.mat');
%load('../feature/rep_protein6.mat');
%load('../feature/rep_protein7.mat');
%54 combine fusion
%load('../feature/rep_drug5.mat');
%load('../feature/rep_protein4.mat');



%21 combine splicing
%load('../feature/rep_drug21.mat');
%load('../feature/rep_drug22.mat');
%load('../feature/rep_protein1.mat');
%21 combine
%load('../feature/rep_drug2.mat');
%load('../feature/rep_protein1.mat');
%22 combine splicing
%load('../feature/rep_drug21.mat');
%load('../feature/rep_drug22.mat');
%load('../feature/rep_protein2.mat');
%22 combine
%load('../feature/rep_drug2.mat');
%load('../feature/rep_protein2.mat');
%23 combine splicing
%load('../feature/rep_drug21.mat');
%load('../feature/rep_drug22.mat');
%load('../feature/rep_protein3.mat');
%23 combine
%load('../feature/rep_drug2.mat');
%load('../feature/rep_protein3.mat');
%24 combine splicing
%load('../feature/rep_drug21.mat');
%load('../feature/rep_drug22.mat');
%load('../feature/rep_protein5.mat');
%load('../feature/rep_protein6.mat');
%load('../feature/rep_protein7.mat');
%24 combine fusion
%load('../feature/rep_drug2.mat');
%load('../feature/rep_protein4.mat');

%61 combine splicing
%load('../feature/rep_drug7.mat');
%load('../feature/rep_drug8.mat');
%load('../feature/rep_drug9.mat');
%load('../feature/rep_protein1.mat');
%61 combine fusion
%drug_feat=rep_drug6;
%prot_feat=rep_protein1;
%62 combine splicing
%load('../feature/rep_drug7.mat');
%load('../feature/rep_drug8.mat');
%load('../feature/rep_drug9.mat');
%load('../feature/rep_protein2.mat');
%62 combine fusion
%drug_feat=rep_drug6;
%prot_feat=rep_protein2;
%63 combine splicing
%load('../feature/rep_drug7.mat');
%load('../feature/rep_drug8.mat');
%load('../feature/rep_drug9.mat');
%load('../feature/rep_protein3.mat');
%63 combine fusion
%drug_feat=rep_drug6;
%prot_feat=rep_protein3;
%64 combine splicing
%load('../feature/rep_drug7.mat');
%load('../feature/rep_drug8.mat');
%load('../feature/rep_drug9.mat');
%load('../feature/rep_protein5.mat');
%load('../feature/rep_protein6.mat');
%load('../feature/rep_protein7.mat');
%64 combine fusion
%drug_feat=rep_drug6;
%prot_feat=rep_protein4;

 
%14 splicing
%drug_feat=rep_drug1;
%prot_feat=[rep_protein5,rep_protein6,rep_protein7];
%%14 combine
%drug_feat=rep_drug1;
%prot_feat=rep_protein4;
%34 splicing
drug_feat=rep_drug3;
prot_feat=[rep_protein5,rep_protein6,rep_protein7];
%%34 combine
%drug_feat=rep_drug3;
%prot_feat=rep_protein4;
%44 splicing
%drug_feat=rep_drug4;
%prot_feat=[rep_protein5,rep_protein6,rep_protein7];
%%44 combine
%drug_feat=rep_drug4;
%prot_feat=rep_protein4;
%54 splicing
%drug_feat=rep_drug5;
%prot_feat=[rep_protein5,rep_protein6,rep_protein7];
%%54 combine
%drug_feat=rep_drug5;
%prot_feat=rep_protein4;

%21 splicing
%drug_feat=[rep_drug21,rep_drug22];
%prot_feat=rep_protein1;
%21 combine
%load('../feature/rep_drug2.mat');
%load('../feature/rep_protein1.mat');
%22 splicing
%drug_feat=[rep_drug21,rep_drug22];
%prot_feat=rep_protein2;
%22 combine
%load('../feature/rep_drug2.mat');
%load('../feature/rep_protein2.mat');
%23 splicing
%drug_feat=[rep_drug21,rep_drug22];
%prot_feat=rep_protein3;
%23 combine
%load('../feature/rep_drug2.mat');
%load('../feature/rep_protein3.mat');
%24 splicing
%drug_feat=[rep_drug21,rep_drug22];
%prot_feat=[rep_protein5,rep_protein6,rep_protein7];
%24 combine fusion
%load('../feature/rep_drug2.mat');
%load('../feature/rep_protein4.mat');

%61 splicing
%drug_feat=[rep_drug7,rep_drug8,rep_drug9];
%prot_feat=rep_protein1;
%61 combine fusion
%load('../feature/rep_drug6.mat');
%load('../feature/rep_protein1.mat');
%62 splicing
%drug_feat=[rep_drug7,rep_drug8,rep_drug9];
%prot_feat=rep_protein2;
%62 combine fusion
%load('../feature/rep_drug6.mat');
%load('../feature/rep_protein2.mat');
%63 splicing
%drug_feat=[rep_drug7,rep_drug8,rep_drug9];
%prot_feat=rep_protein3;
%63 combine fusion
%load('../feature/rep_drug6.mat');
%load('../feature/rep_protein3.mat');
%64 splicing
%drug_feat=[rep_drug7,rep_drug8,rep_drug9];
%prot_feat=[rep_protein5,rep_protein6,rep_protein7];
%64 combine fusion
%load('../feature/rep_drug6.mat');
%load('../feature/rep_protein4.mat');

% feature normalization
for i=1:size(drug_feat,2)   %��������
    if (norm(drug_feat(:,i)) > 0)
        drug_feat(:,i) = drug_feat(:,i)/norm(drug_feat(:,i));
    end
end
for i=1:size(prot_feat,2)
    if (norm(prot_feat(:,i)) > 0)
        prot_feat(:,i) = prot_feat(:,i)/norm(prot_feat(:,i));
    end
end


nFold = 5;
Nrepeat = 1;


AUROC = zeros(Nrepeat, 1);
AUPRC = zeros(Nrepeat, 1);

for p = 1 : Nrepeat
    fprintf('Repetition #%d\n', p);
    [AUROC(p), AUPRC(p)] = PUMC(p, nFold, interaction, drug_feat, prot_feat, dim_imc);
end

for i = 1 : Nrepeat
	fprintf('Repetition #%d: AUROC=%.6f, AUPR=%.6f\n', i, AUROC(i), AUPRC(i));
end
fprintf('Mean: AUROC=%.6f, AUPR=%.6f\n', mean(AUROC), mean(AUPRC));
