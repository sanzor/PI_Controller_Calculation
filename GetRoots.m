function [rez] = GetRoots(q0)
%q0=[0.2 -1.8]
%ROOTS Summary of this function goes here
%   Gasim radacinile reale,negative cu ord de multiplicitate
rez=[];
u=roots(q0);
%reale negative
uu=u(u<0 & (real(u)==u) );
mult=0;
uniques=unique(uu);

%mult impara
for i=1:length(uniques)
    mult=0;
    for j=1:length(uu)
        if uu(j)==uniques(i)
            
            mult=mult+1;
        end
    end
    mult
    if rem(mult,2)==1
        rez=[rez uniques(i)];
    end
end
end

    

