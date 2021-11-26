function [z1, z2, z3, z4] = classoffoursoftmax(x1, x2, x3, x4)
%SOFTMAX Summary of this function goes here
%   Detailed explanation goes here
y1 = exp(x1);
y2 = exp(x2);
y3 = exp(x3);
y4 = exp(x4);

sum = y1 + y2 + y3 + y4;

z1 = y1 ./ sum;
z2 = y2 ./ sum;
z3 = y3 ./ sum;
z4 = y4 ./ sum;

end

