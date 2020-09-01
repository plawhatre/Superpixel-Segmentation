function [I] = sel_img()
warning off
addpath('input_images')
%Image selection
list = {'54082.jpg','69020.jpg','101085.jpg','106024.jpg','189080.jpg','210088.jpg','295087.jpg'};
[indx] = listdlg('ListString',list,'SelectionMode','single');
if indx==1
    %reading image
    I=imread('54082.jpg');
end
if indx==2
    %reading image
    I=imread('69020.jpg');
end
if indx==3
    %reading image
    I=imread('101085.jpg');
end
if indx==4
    %reading image
    I=imread('106024.jpg');
end
if indx==5
    %reading image
    I=imread('189080.jpg');
end
if indx==6
    %reading image
    I=imread('210088.jpg');
end
if indx==7
    %reading image
    I=imread('295087.jpg');
end
end

