function [precision, recall, F1, roc, pr] = auc(label, score, perturb_std, pr_thres)
  if ~exist('perturb_std', 'var')
    perturb_std = 0;
  end

  if ~exist('pr_thres', 'var')
    pr_thres = inf;
  end

  label = label(:);
  score = score(:);

  noise = sqrt(perturb_std) * randn(length(score), 1);
  score = score + noise;

  [score1,ord] = sort(score, 'descend');
  label = label(ord);

  P = nnz(label);
  N = length(label) - P;

  TP = cumsum(label);
  PP = (1:length(label))';

  % ROC
  rocx = (PP - TP) ./ N;
  rocy = TP ./ P;
  roc = trapz(rocx, rocy);
  
  % PR
  prx = rocy;
  pry = TP ./ PP;

  if TP(end) > pr_thres
    trunc = find(TP > pr_thres, 1, 'first') - 1;
    pr = trapz(prx(1:trunc), pry(1:trunc)) / prx(trunc);
  else
    pr = trapz(prx, pry);
  end
  
  %F1
  recall = sum(prx);
  precision = sum(pry);
  recall = recall ./ length(label);
  precision = precision ./ length(label);
  F1 = 2 .* recall .* precision ./ (recall + precision);
end
