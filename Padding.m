function [qo] = Padding(aux1,aux2)
if size(aux1,2)>size(aux2,2)
    aux2 = [zeros(1,size(aux1,2)-size(aux2,2)) aux2];
elseif size(aux1,2)<size(aux2,2)
    aux1 = [zeros(1,size(aux2,2)-size(aux1,2)) aux1];
end
qo=aux1-aux2;
end

