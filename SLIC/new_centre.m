function [c_new] = new_centre(L,c,k_n)
 %new centres
    [cm,cn]=size(L);
    c_new=c;
    for i=1:k_n
        cen=[];
        for j=1:cm
            for k=1:cn
                if L(j,k)==i
                    cen=[cen;j k];
                end
            end
        end
        c_new(i,1)=floor(def_sum(cen(:,1))/numel(cen(:,1)));
        c_new(i,2)=floor(def_sum(cen(:,2))/numel(cen(:,2)));
    end
end

