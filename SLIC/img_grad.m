function [G] = img_grad(J)
%initializaation
[m,n,~]=size(J);
G=zeros(m,n);
%padding
I=padarray(J,[1 1]);
[m,n,~]=size(I);
for i=2:(m-1)
    for j=2:(n-1)
        %neighbour pixels
        xn=[I(i+1,j,1),I(i+1,j,2),I(i+1,j,3)];
        xp=[I(i-1,j,1),I(i-1,j,2),I(i-1,j,3)];
        yn=[I(i,j+1,1),I(i,j+1,2),I(i,j+1,3)];
        yp=[I(i,j-1,1),I(i,j-1,2),I(i,j-1,3)];
        %x_comp
        x_c=xn-xp;
        gx=def_sum(x_c.^2);
        %y_comp
        y_c=yn-yp;
        gy=def_sum(y_c.^2);
        %total
        G(i-1,j-1)=gx+gy;
    end
end
end

