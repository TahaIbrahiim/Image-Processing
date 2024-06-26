function [inverselogimg] = inverse_log(img)
[h, w] = size(img);
img = double(img);
L = 256;
C = (L - 1 )/log(L);
for i = 1 : h
    for j = 1 : w
        inverselogimg(i,j) = (exp(img(i,j)) ^ (1/C)) - 1;
    end
end
inverselogimg = uint8(inverselogimg);
end
