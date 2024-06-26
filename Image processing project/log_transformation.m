function [logimg] = log_transformation(img)
[h, w] = size(img);
img = double(img);
L = 256;
C = (L - 1 )/log(L);
for i = 1 : h
    for j = 1 : w
        logimg(i,j) = log(img(i,j)+1) * C;
    end
end
logimg = uint8(logimg);
end