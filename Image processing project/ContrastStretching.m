function [new_img] = ContrastStretching(img,new_min,new_max)
    img = double(img);
    old_max = max(img(:));
    old_min = min(img(:));
    [h, w] = size(img);
    new_img = zeros(h, w);
    new_img = im2double(new_img);

    for i = 1:h
        for j = 1:w
            new_img(i, j) = ( ((img(i, j) - old_min) / (old_max - old_min)) * (new_max - new_min) ) + new_min;
        end
    end

    new_img = uint8(new_img);
end
