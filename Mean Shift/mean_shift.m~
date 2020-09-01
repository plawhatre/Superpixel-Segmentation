function [P]=mean_shift(h,L,i,j,m_rad,bndw)
P=zeros(2*m_rad+1);
X=img2vect(h);
%distance from mean
xc=X(:,ceil(end/2));
diff=X-xc;
sumd=diff.^2;
dist=sum(sumd);
lbl=max(L(:))+1;
%label assignment
for i=1:length(dist)
    dist(i)<bndw*10
    [xcor,ycor]=crd2met(i,2*m_rad+1,2*m_rad+1);
    P(xcor,ycor)=lbl;
end

end

