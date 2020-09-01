function [X] = img2vect(J)
%spatial coordinates
[m,n]=size(J(:,:,1));
x_cor=1:m;
x_cor=repmat(x_cor',1,n);
x_cor=x_cor';
x_cor=x_cor(:)';
y_cor=1:n;
y_cor=repmat(y_cor,1,m);
cor=[x_cor;y_cor];
%lab colour space features
fL=J(:,:,1);
fL=fL(:)';
fA=J(:,:,2);
fA=fA(:)';
fB=J(:,:,3);
fB=fB(:)';
fLAB=[fL;fA;fB];
%5D vectors
X=[cor;fLAB];
end

