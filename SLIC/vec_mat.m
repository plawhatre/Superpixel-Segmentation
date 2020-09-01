function [v] = vec_mat(u,n,typ)
v=zeros(n,typ);
for i=1:n
    v(i,:)=u;
end
end

