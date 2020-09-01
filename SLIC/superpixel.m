tic
clc,clear,close all
warning off
addpath('input_images')
%%read image
I=sel_img();
%show image
subplot(1,2,1)
imshow(I)
title('Original')
%converting to double
I=im2double(I);
%%convert rgb to CIELAB(STEP 1)
J=rgb2lab(I);
%%number of clusters and their centres (STEP 2)
k_n=300;%input('enter the number of superpixels');
c=initial_centre(J,k_n);
%%image gradient(STEP 3)
G=img_grad(J);
%%perturb centre(STEP 4)
c=perturb_centre(G,c);
%%iterative clustering(STEP 5)
%label matrix
L=zeros(size(G));
%centre pixels vector
[mc,~]=size(c);
vc=zeros(mc,3);
for i=1:mc
    vc(i,:)=vectorise(J,c(i,1),c(i,2));
end
%clusters
for itr=1:10
    [m,n,~]=size(J);
    %distance (pixel to centre)
    for i=1:m
        for j=1:n
            v=vectorise(J,i,j);
            v=vec_mat(v,mc,3);
            u=[i,j];
            u=vec_mat(u,mc,2);
            %lab distance
            d_lab=lab_dist(vc,v);
            %xy distance
            d_xy=xy_dist(c,u);
            %cummulative distance
            D=d_lab+(10/sqrt(numel(G)/k_n)).*d_xy;
            %min
            %%[~,ind]=bubble_srt(D);
            [~,ind]=sort(D);
            ind=ind(1);
            %cluster assignment
            L(i,j)=ind;
        end
    end
   c_new=new_centre(L,c,k_n);
    %change in centre
    L1_nrm=abs(c_new-c);
    L1_nrm=L1_nrm(:,1)+L1_nrm(:,2);
    cnd=(L1_nrm<10);
    c=c_new;
    itr
end
subplot(1,2,2)
imshow(L,[])
title('superpixel segmented')
%CONNECTIVITY(STEP6)
L=connect(L);
%DETECT BORDERS(STEP7)
B=detect_border(L);
%DRAW CONTOUR(STEP8)
rgb=[255 0 0];
J=draw_borders(I,B,rgb);
subplot(1,2,2)
imshow(J)
title('Superpixel segmented')
toc