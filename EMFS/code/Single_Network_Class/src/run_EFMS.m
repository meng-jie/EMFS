clear;
clc
dim_drug = 100;
dim_prot = 400;
dim_imc = 200;

% matrix:732*1915
interaction = load('../data/drugProtein.txt');

% load embedding features
%11 combine
%load('../feature/rep_drug1.mat');
%load('../feature/rep_protein1.mat');
%12 combine
%load('../feature/rep_drug1.mat');
%load('../feature/rep_protein2.mat');
%13 combine
%load('../feature/rep_drug1.mat');
%load('../feature/rep_protein3.mat');
%31 combine
%load('../feature/rep_drug3.mat');
%load('../feature/rep_protein1.mat');
%32 combine
%load('../feature/rep_drug3.mat');
%load('../feature/rep_protein2.mat');
%33 combine
%load('../feature/rep_drug3.mat');
%load('../feature/rep_protein3.mat');
%41 combine
%load('../feature/rep_drug4.mat');
%load('../feature/rep_protein1.mat');
%42 combine
%load('../feature/rep_drug4.mat');
%load('../feature/rep_protein2.mat');
%43 combine
%load('../feature/rep_drug4.mat');
%load('../feature/rep_protein3.mat');
%51 combine
%load('../feature/rep_drug5.mat');
%load('../feature/rep_protein1.mat');
%52 combine
%load('../feature/rep_drug5.mat');
%load('../feature/rep_protein2.mat');
%53 combine
%load('../feature/rep_drug5.mat');
%load('../feature/rep_protein3.mat');


%11 combine
%drug_feat=rep_drug1;
%prot_feat=rep_protein1;
%12 combine
%drug_feat=rep_drug1;
%prot_feat=rep_protein2;
%13 combine
%drug_feat=rep_drug1;
%prot_feat=rep_protein3;
%31 combine
%drug_feat=rep_drug3;
%prot_feat=rep_protein1;
%32 combine
%drug_feat=rep_drug3;
%prot_feat=rep_protein2;
%33 combine
%drug_feat=rep_drug3;
%prot_feat=rep_protein3;
%41 combine
%drug_feat=rep_drug4;
%prot_feat=rep_protein1;
%42 combine
%drug_feat=rep_drug4;
%prot_feat=rep_protein2;
%43 combine
%drug_feat=rep_drug4;
%prot_feat=rep_protein3;
%51 combine
%drug_feat=rep_drug5;
%prot_feat=rep_protein1;
%52 combine
%drug_feat=rep_drug5;
%prot_feat=rep_protein2;
%53 combine
%drug_feat=rep_drug5;
%prot_feat=rep_protein3;
 
 
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
