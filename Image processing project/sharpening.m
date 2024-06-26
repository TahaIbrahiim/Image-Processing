function [sharp_img] = sharpening(img,op)
    if op==1
        mask=[0 1 0;0 1 0;0 -1 0];
    end
    if op==2
        mask=[0 0 0;1 1 -1;0 0 0];
    end
    if op==3
        mask=[0 0 1;0 1 0;-1 0 0];
    end
    if op==4
        mask=[1 0 0;0 1 0;0 0 -1];
    end
    if op==5
        mask=[0 -1 0;-1 5 -1;0 -1 0];
    end
    sharp_img=filter2(mask,img);
    sharp_img=uint8(sharp_img);
end