function [rez] = Intersect(span1,span2)
A=span1(1);
B=span1(2);

C=span2(1);
D=span2(2);

if C>B || A>D
    rez=[];
else
    rez=[max(A,C) min(B,D)];
end


end
