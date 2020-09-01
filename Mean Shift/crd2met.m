function [x,y] = crd2met(l,m,n)
x=ceil(l/n);
y=mod(l,n);
if y==0
    y=n;
end
end

