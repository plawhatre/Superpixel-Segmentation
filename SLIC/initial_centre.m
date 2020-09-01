function [c] = initial_centre(J,k)
[m,n,~]=size(J);
num=m*n;
% q=randperm(num,k+2*(m+n)+2000);
q=round(linspace(1,num,k+2*(m+n)));
cm=floor(q./n)+1;
cn=mod(q,n);
cn(cn==0)=n;
c=[cm;cn];
c=unique(c,'rows');
c=c';
%%%%%%%%%%%%%%%%%%%%
c(c(:,1)==1,:)=[];
c(c(:,1)==m,:)=[];
c(c(:,2)==1,:)=[];
c(c(:,2)==n,:)=[];

%%%%%%%%%%%%%%%%%%%%
[cz,~]=size(c);
c=c(round(linspace(1,cz,k)),:);
end

