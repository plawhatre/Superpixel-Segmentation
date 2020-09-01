function c=perturb_centre(G,c)
len=length(c);
for i=1:len
    x=c(i,1);
    y=c(i,2);
    h=G((x-1):(x+1),(y-1):(y+1));
    %initialization
    min=h(1,1);
    pos_x=1;
    pos_y=1;
    for i1=1:3
        for i2=1:3
            if min>h(i1,i2)
                min=h(i1,i2);
                pos_x=i1;
                pos_y=i2;              
            end
        end
    end
    if sum(any(c==[pos_x-2+x,pos_y-2+y]))~=2
        c(i,:)=[pos_x-2+x,pos_y-2+y];
    end
end

