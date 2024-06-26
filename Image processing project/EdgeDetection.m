function [Edged_img] = EdgeDetection(img, mask_name, op)
    if strcmp(mask_name, 'laplacian mask')
        if op == 1
            mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];
        end
        if op == 2
            mask = [0 -1 0; -1 4 -1; 0 -1 0];
        end
    end

    if strcmp(mask_name, 'sobel mask')
        if op == 1
            mask = [-1 -2 -1; 0 0 0; 1 2 1];
        end
        if op == 2
            mask = [-1 0 1; -2 0 2; -1 0 1];
        end
        if op == 3
            mask = [2 1 0; 1 0 -1; 0 -1 -2];
        end
        if op == 4
            mask = [0 -1 -2; 1 0 -1; 2 1 0];
        end
    end

    if strcmp(mask_name, 'robert mask')
        if op == 1
            mask = [0 1 0; 0 0 0; 0 -1 0];
        end
        if op == 2
            mask = [0 0 0; 1 0 -1; 0 0 0];
        end
        if op == 3
            mask = [1 0 0; 0 0 0; 0 0 -1];
        end
        if op == 4
            mask = [0 0 1; 0 0 0; -1 0 0];
        end
    end

    Edged_img = filter2(mask, img);
    Edged_img = uint8(Edged_img);
end
