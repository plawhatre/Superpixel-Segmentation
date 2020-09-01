function [J]=draw_borders(J,L,c_val)
[m,n]=size(L);

for i=1:m
    for j=1:n
        if L(i,j)==1
            J(i,j,1)=c_val(1);
            J(i,j,2)=c_val(2);
            J(i,j,3)=c_val(3);
        end
    end
end
end

