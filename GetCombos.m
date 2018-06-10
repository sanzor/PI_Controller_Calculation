function [fcomb] = GetCombos(coefs,nr)
n = size(coefs,2);
states = [-1,1];
m = numel(states);
sz = m*ones(1,n);
idx = {0};
idx = repmat(idx,1,n);
comb = zeros(m^n,n);
for i = 1:(m^n)
[idx{:}] = ind2sub(sz,i);
comb(i,:) =states([idx{:}]);
end
fcomb=[];
for i=1:size(comb,1)
    sum=0;
    for j=1:n
        sum=sum+comb(i,j)*coefs(j);
    end
    if sum==nr
        fcomb=[fcomb comb(i,:)];
    end
end


