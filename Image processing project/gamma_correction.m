function [gammaimg] = gamma_correction(img , gamma)
[h, w] = size(img);
img = double(img);
for i = 1 : h
    for j = 1 : w
        img(i,j) = img(i,j)/255;
        gammaimg(i,j) = 1 * img(i,j) ^ gamma;
    end
end
end