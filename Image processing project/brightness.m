function [newimg] = brightness(img,option,t)
[h , w] = size(img);
newimg = zeros(h,w);
newimg = double(newimg);
for i = 1 : h
    for j = 1 : w
        if option == 1
            newimg(i,j) = img(i,j) + t;
        end
        if option == 2
            newimg(i,j) = img(i,j) - t;
        end
        if option == 3
            newimg(i,j) = img(i,j) * t;
        end
        if option == 4
            newimg(i,j) = img(i,j) / t;
        end
    end
end
newimg = uint8(newimg);
end
