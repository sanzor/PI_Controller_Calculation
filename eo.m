function [p_even,p_odd] = eo(poli)
p_even=[];
p_odd=[];
order=size(poli,2);
order;
    if(mod(order,2)==0)
        for i=1:order
            if rem(i,2)==0
                p_even=[p_even poli(i)];
            else
                p_odd=[p_odd poli(i)];
            end
        end         
    else
        for i=order:-1:1
            if rem(i,2)==1
                p_even=[poli(i) p_even];
            else
                p_odd=[poli(i) p_odd];
            end
        end
    end

 if size(p_odd,2)==0
     p_odd=0;
 end
 if size(p_even,2)==0
     p_even=0;
 end
end

