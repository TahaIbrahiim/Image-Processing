function [new_img] = rayleigh_noise(img,a,b)
img=double(img);
[h w l]=size(img);

for i=1:255
    num_of_pixel=round(((exp(i-a)^2/b)*(i-a)*(2/b))*w*h);
    
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
