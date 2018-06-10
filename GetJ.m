function [j] = GetJ(qo)
    val=polyval(qo,0);
    if val>0 
        j=1;
    else
        j=-1;
    end
end

