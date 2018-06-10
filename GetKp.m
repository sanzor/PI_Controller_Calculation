function [Kp] = GetKp(qo1,qo2)
Kp=[];

Kp=[Kp -(polyval(qo1,0)/polyval(qo2,0))];

if length(qo1)==length(qo2)
    Kp=[Kp 1];
elseif length(qo1)<length(qo2)
    Kp=[Kp 0];
end
end

