function [t] = GetT(sigma)
if mod(sigma,2)==0
    t=(sigma-2)/2;
else
    t=(sigma-1)/2;
end
end

