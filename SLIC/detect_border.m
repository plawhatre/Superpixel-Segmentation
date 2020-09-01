function [B] = detect_border(L)
B=0.*L;
L=padarray(L,[1 1],'replicate');
[m,n]=size(L);
for i=2:(m-1)
    for j=2:(n-1)
        %verticle edge
        ve=L(i,j)-L(i,j-1);
        if ve~=0
            B(i-1,j-1)=1;
        end
        %horizontal edge
        he=L(i,j)-L(i-1,j);
        if he~=0
            B(i-1,j-1)=1;
        end
    end
end
end

