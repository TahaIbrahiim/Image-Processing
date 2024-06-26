function [new_img] = Gussian_noise(img,sv,mean)
img=double(img);
[h w l]=size(img);

for i=1:255
    num_of_pixel=round(((exp(-((i-mean)^2/(2*sv*sv))))/(sqrt(2*3.14*sv*sv)))*w*h);
    
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

