function [ binary ] = GRAY2BINARY( I_gray )

[H, W] = size(I_gray);
binary = zeros(H, W);

for i = 1:H
    for j = 1:W
        if I_gray(i,j) > 128
            binary(i,j) = 1;
        end
    end
end

end

