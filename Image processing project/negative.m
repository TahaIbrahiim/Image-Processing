function [inverseimg] = negative(img)
[h, w] = size(img);
for i = 1 : h
    for j = 1 : w
        inverseimg(i,j) = 255 - img(i,j);
    end
end
end