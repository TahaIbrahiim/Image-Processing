function [new_img] = uniform_noise(img,a,b)
img=double(img);
[h w l]=size(img);

num_of_pixel=round((1/(b-a))*w*h);

for i=a:b
    for j=1:num_of_pixel
        row=ceil(rand(1,1)*h);
        colum=ceil(rand(1,1)*w);
        img(row,colum)=img(row,colum)+i;
    end          
end

mn=min(img(:));
mx=max(img(:));
new_img=((img-mn)/(mx-mn))*255;

new_img=uint8(new_img);
end