function [rez] = PI_CONT(b,a)
m=size(b,2)-1;
n=size(a,2)-1;
%roots
ra=roots(a);
rb=roots(b);


%Pas 1 -calcul t
zd=length(rb(real(rb)>0));
zs=length(rb(real(rb)<0));

t=0;
sigma=n-m+2*zd+1;
t=GetT(sigma);
m
n
zd
zs
t

[ae,ao]=eo(a);
[be,bo]=eo(b);
disp('Polinoamele ae,ao,be,bo sunt:');
ae
ao
be
bo

%q0 calc
aux1=conv(ae,be);
aux2=conv([1 0],conv(ao,bo));

qo1=Padding(aux1,aux2);
qo1
aux1=conv(be,be);
aux2=conv([1 0],conv(bo,bo));

qo2=Padding(aux1,aux2);
qo2

Kp=GetKp(qo1,qo2);

disp('verificam relatie q01q02-q02q01=0');

aux1=conv(qo1,polyder(qo2));
aux2=conv(qo2,polyder(qo1));
dif=Padding(aux1,aux2);

rts=roots(dif);
K=[]
for i=1:length(rts)
    K=[K -(polyval(qo1,rts(i)))/polyval(qo2,rts(i))];
end
K=sort(K);
Kfixed=[];
for i=1:length(K)-1
    Kfixed=[Kfixed (K(i+1)-K(i))/2];
end



%calculam radacini

Ki=[];
Matrix=[];
for i=1:length(Kfixed)
    q_o=conv(qo1,(conv([Kfixed(i) 0] ,qo2)));
    rts=GetRoots(q_o);
    if length(rts)==0
        fprintf('Nu s-au gasit radaicini R-N-M pentru K%d\n',Kfixed(i));
        continue
    end
    rts=[0 rts Inf];
    j=GetJ(q_o);
    coefs=GetCoefs(t,n+m+1);
    I=GetCombos(coefs,j*sigma);
    D=[];
    for j=1:length(rts)-1
        rt=rts(j);
        temp1=conv([rt 0],conv(ao,be));
        temp2=conv([rt 0],conv(ae,bo));
        temp3=conv(be,be)-conv([rt 0],conv(bo,bo));
        Ki=polyval(temp2-temp1,rt)/polyval(temp3,rt);
        if I(j)>0
        D=[D ;[K Inf]];
        else 
        D=[D ;[-Inf K]];
        end
    end
    
    rez=D(1,:);
    for k=1:length(D)
        rez=Intersect(rez,D(k,:));
    end
    Matrix=[Matrix; Kfixed(i) rez];
    
    
end
disp('Solutia este de forma: Matrix=[ [Kp1 Ki1 ...Kin] [Kp2 Ki1 ...Kin] ...[Kpn Ki1...Kin]]');
Matrix
  
end





