function [new_img] = salt_pepper_noise(img,ps,pp)
[H W L]=size(img);
num_of_salt=round(ps*W*H);
num_of_pepper=round(pp*W*H);

for i=1:num_of_salt
    row=ceil(rand(1,1)*H);
    colum=ceil(rand(1,1)*W);
    img(row,colum)=255;
end

for i=1:num_of_pepper
    row=ceil(rand(1,1)*H);
    colum=ceil(rand(1,1)*W);
    img(row,colum)=0;
end

new_img=img
new_img=uint8(new_img);
end