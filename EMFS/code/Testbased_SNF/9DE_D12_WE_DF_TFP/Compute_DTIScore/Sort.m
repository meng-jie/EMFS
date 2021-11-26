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

DSort1 = S_avg';       %all drug's target score sort
TSort1 = S_avg;        %all target's drug score sort

DSort = zeros(size(DSort1,1),size(DSort1,2));      %以药物为主线，排序某一药物与所有靶标得分
DBiao = zeros(size(DSort1,1),size(DSort1,2));      %得分排序后分别对应的靶标编号

TSort = zeros(size(TSort1,1),size(TSort1,2));     
TBiao = zeros(size(TSort1,1),size(TSort1,2));

%drug sort
for i = 1:size(DSort1,2)
    c = DSort1(:,i);
    [a,b] = sort(c,'descend');
    DSort(:,i) = a;
    DBiao(:,i) = b;
end

% target sort
for i = 1:size(TSort1,2)
    c = TSort1(:,i);
    [a,b] = sort(c,'descend');
    TSort(:,i) = a;
    TBiao(:,i) = b;
end

DSort = DSort';
DBiao = DBiao';
TSort = TSort';
TBiao = TBiao';

%add known lable
lable = load('data/drugProtein.txt');
DLable = zeros(size(DBiao,1),size(DBiao,2));
TLable = zeros(size(TBiao,1),size(TBiao,2));

%drug lable
for i = 1:size(DBiao,1)
    for j = 1:size(DBiao,2)
        c = DBiao(i,j);
        DLable(i,j) = lable(i,c);
    end
end

%target lable
lable = lable';
for i = 1:size(TBiao,1)
    for j = 1:size(TBiao,2)
        c = TBiao(i,j);
        TLable(i,j) = lable(i,c);
    end
end

save('DTIScore/DSort.mat','DSort');
save('DTIScore/DBiao.mat','DBiao');
save('DTIScore/DLable.mat','DLable');

save('DTIScore/TSort.mat','TSort');
save('DTIScore/TBiao.mat','TBiao');
save('DTIScore/TLable.mat','TLable');