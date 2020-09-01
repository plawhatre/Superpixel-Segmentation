function [R]=connect(L)
X=padarray(L,[1 1],'replicate');
R=L;
[m,n]=size(X)
for i=2:(m-1)
    for j=2:(n-1)
        %neighbourhood
        h=X((i-1):(i+1),(j-1):(j+1));
        h=h(:);
        h(5)=[];
        %central pixel
        c=X(i,j);
        t=unique(h);
        %completly surrounded by same labels
        if numel(t)==8
            R(i-1,j-1)=mode(t);
        end
        %surrounded by completly different labels
        if any(c~=h)
            R(i-1,j-1)=mode(t);
        end
    end
end
end

