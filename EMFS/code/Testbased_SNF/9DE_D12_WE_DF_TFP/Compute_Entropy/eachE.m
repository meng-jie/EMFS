function [Entropy] = eachE(network)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A = network;
[r,c] = size(A);
p = zeros(r,c);
E = zeros(r,c);
ASum = sum(A,2);
for i = 1:r
    for j = 1:c
        if ASum(i,1) == 0
            p(i,j) = 0;
        else
            p(i,j) = A(i,j) ./ ASum(i,1);
        end
        if p(i,j) == 0
            E(i,j) = 0;
        else
            E(i,j) = -p(i,j) .* log(p(i,j));  %log e
        end
    end
end
EI = sum(E,2);
Entropy = 0;
for i = 1:r
    Entropy = Entropy + EI(i,1);
end
Entropy = Entropy ./ r; 
end


