function [dist] = lab_dist(vc,v)
del=vc-v;
del2=del.^2;
[len,~]=size(del2);
sm=zeros(len,1);
for i=1:len
    sm(i)=def_sum(del2(i,:));
end
dist=sqrt(sm);
end

