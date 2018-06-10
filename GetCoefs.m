function [coefs] = GetCoefs(t,nm_sum)
coefs=[1];
for i=1:t
    coefs=[coefs 2*((-1)^i)];
end
if mod(nm_sum,2)==0
coefs=[coefs 1];
end
end

