%% Calculate Positive Pointwise Mutual Information Matrix %%

function PPMI = GetPPMIMatrix(M)

M = ScaleSimMat(M);

[p, q] = size(M);
assert(p==q, 'M must be a square matrix!');  %if

col = sum(M);     %每列求和的行向量
row = sum(M,2);    %每行求和的行向量

D = sum(col,2);     %矩阵中所有值求和
PPMI = log(D * M ./(row*col));
PPMI(PPMI<0)=0;        %负为0.
IdxNan = isnan(PPMI);  %判断数组中的元素是否为NaN(非数值),是返回1，否则返回0.
PPMI(IdxNan) = 0;

end