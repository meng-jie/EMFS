%% Calculate Positive Pointwise Mutual Information Matrix %%

function PPMI = GetPPMIMatrix(M)

M = ScaleSimMat(M);

[p, q] = size(M);
assert(p==q, 'M must be a square matrix!');  %if

col = sum(M);     %ÿ����͵�������
row = sum(M,2);    %ÿ����͵�������

D = sum(col,2);     %����������ֵ���
PPMI = log(D * M ./(row*col));
PPMI(PPMI<0)=0;        %��Ϊ0.
IdxNan = isnan(PPMI);  %�ж������е�Ԫ���Ƿ�ΪNaN(����ֵ),�Ƿ���1�����򷵻�0.
PPMI(IdxNan) = 0;

end