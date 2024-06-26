function [new_img] = exponential_noise(img,a)
img=double(img);
[h w l]=size(img);

for i=1:255

    num_of_pixel=round((exp(-(a*i))*a ) *w*h);
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