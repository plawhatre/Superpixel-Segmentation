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
%%convert rgb to CIELAB
J=rgb2lab(I);
%parameters
bndw=0.6;
bndw2=bndw^2;
m_rad=50;
[m,n,~]=size(J);
N=m*n;
%padding image
J=padarray(J,[m_rad m_rad],'replicate');
%label matrix
L=zeros(m,n);
for i=(1+m_rad):(m-m_rad)
    for j=(1+m_rad):(n-m_rad)
        %kernel
        h=J((i-m_rad):(i+m_rad),(j-m_rad):(j+m_rad));
        L=mean_shift(h,L,i,j,m_rad,bndw);
    end
end






