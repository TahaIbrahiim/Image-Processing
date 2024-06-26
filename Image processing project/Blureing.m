function [Blure_img] = Blureing(img,mask_name)
    if strcmp(mask_name, 'box filter')
        mask=ones(3,3)/9;
    end
    if strcmp(mask_name, 'weighted filter')
        mask=[1 2 1;2 4 2;1 2 1]/16;
    end
    Blure_img=filter2(mask,img);
    Blure_img=uint8(Blure_img);
end