clear;
clc
dim_drug = 100;
dim_prot = 400;
dim_imc = 200;

% matrix:732*1915
interaction = load('../data/drugProtein.txt');

% load embedding features
load('../feature/rep_drug.mat');
load('../feature/rep_protein1.mat');
load('../feature/rep_protein2.mat');
load('../feature/rep_protein3.mat');
load('../feature/rep_protein4.mat');

drug_feat=rep_drug;
prot_feat=[rep_protein2,rep_protein3,rep_protein4];

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


precision = zeros(Nrepeat, 1);
recall = zeros(Nrepeat, 1);
F1 = zeros(Nrepeat, 1);
AUROC = zeros(Nrepeat, 1);
AUPRC = zeros(Nrepeat, 1);

for p = 1 : Nrepeat
    fprintf('Repetition #%d\n', p);
    [precision(p), recall(p), F1(p), AUROC(p), AUPRC(p)] = PUMC(p, nFold, interaction, drug_feat, prot_feat, dim_imc);
end

for i = 1 : Nrepeat
	fprintf('Repetition #%d: precision=%.6f, recall=%.6f, F1=%.6f, AUROC=%.6f, AUPRC=%.6f\n', i, precision(i), recall(i), F1(i), AUROC(i), AUPRC(i));
end
fprintf('Mean: precision=%.6f, recall=%.6f, F1=%.6f, AUROC=%.6f, AUPRC=%.6f\n', mean(precision), mean(recall), mean(F1), mean(AUROC), mean(AUPRC));
