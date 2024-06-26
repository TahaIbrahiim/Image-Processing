function [ gray ] = RGB2GRAY( I_rgb, index )

[H, W, L] = size(I_rgb);
gray = zeros(H, W);
gray = double(gray);

for i = 1:H
    for j = 1:W
        if index == 1
            gray(i,j) = (I_rgb(i, j, 1) + I_rgb(i, j, 2) + I_rgb(i, j, 3)) / 3;
        end
        if index == 2
            gray(i,j) = I_rgb(i, j, 1);
        end
        if index == 3
            gray(i,j) = I_rgb(i, j, 2);
        end
        if index == 4
            gray(i,j) = I_rgb(i, j, 3);
        end
        if index == 5
            gray(i,j) = (I_rgb(i, j, 1) * 0.2) + (I_rgb(i, j, 2) * 0.3) + (I_rgb(i, j, 3) * 0.5);
        end
    end
end

gray = uint8(gray);

end

