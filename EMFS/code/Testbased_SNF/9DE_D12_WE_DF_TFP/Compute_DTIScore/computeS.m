%5-fold avg DTScore
s11 = load('DTIScore/predictDTIScore_1Fold.mat');
s21 = load('DTIScore/predictDTIScore_2Fold.mat');
s31 = load('DTIScore/predictDTIScore_3Fold.mat');
s41 = load('DTIScore/predictDTIScore_4Fold.mat');
s51 = load('DTIScore/predictDTIScore_5Fold.mat');
s1 = s11.Zscore;
s2 = s21.Zscore;
s3 = s31.Zscore;
s4 = s41.Zscore;
s5 = s51.Zscore;

S_avg = (s1 + s2 + s3 + s4 + s5) ./ 5;

%get id of drug and target
[m,n] = size(S_avg);

S1 = cell(m*n,3);
x =0; 

for i = 1:m
    for j = 1:n 
        x = x+1;
        S1{x,1} = S_avg(i,j);
        S1{x,2} = i;
        S1{x,3} = j;
    end
end

S1 = sortrows(S1,1,'descend');

%add known lable
lable = load('data/drugProtein.txt');
D = importdata('data/drug_dict.txt');
T = importdata('data/protein_dict.txt');


y = size(S1,1);
S1L = zeros(m*n,4);

for i = 1:size(S1L,1)
    S1L(i,1) = S1{i,2};    %Drug_ID
%     S1L{i,2} = D{S1{i,2},1};
%     S1L{i,3} = T{S1{i,3},1};
    S1L(i,2) = S1{i,3};    %Target_ID
    S1L(i,3) = S1{i,1};    %predicted_score
    S1L(i,4) = lable(S1L(i,1),S1L(i,2));   %Known lable
end

%contain all label=0£¬1
save('DTIScore/SortLable01','S1L');

%delete label==1
count = 0;
for i = 1:size(S1L,1)
    if S1L(i,4) == 1
        for j = 1:4
            S1L(i,j) = 0;
        end
        count = count+1;
    end
end


S1LL = zeros(size(S1L,1)-count,4);
i = 1;
j = 1;
while i<1+size(S1L,1) && j<1+size(S1LL,1)
    if S1L(i,:) == 0
        i = i+1;
    else
        S1LL(j,:) = S1L(i,:);
        j = j +1;
        i = i + 1;
    end
end

Sort = cell(size(S1LL,1),6);

for i = 1:size(Sort,1)
    Sort{i,1} = S1LL(i,1);         %Drug_ID
    Sort{i,2} = D{Sort{i,1},1};      %Drug_Name
    Sort{i,3} = S1LL(i,2);         %Target_ID
    Sort{i,4} = T{Sort{i,3},1};       %Target_Name
    Sort{i,5} = S1LL(i,3);    %predicted_score
    Sort{i,6} = lable(S1LL(i,1),S1LL(i,2));   %Known lable
end

% Sort = cell2mat(Sort);
save('DTIScore/SortLable0','Sort');




