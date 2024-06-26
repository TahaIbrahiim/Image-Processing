function [ image_filter_apply ] = ideal_high( I, D0 )

[H, W, L] = size(I);
filter = zeros(H, W, L);

% CREATE FILTER
for j=1:H
    for k=1:W
        dis = sqrt((j-(H/2))^2+(k-(W/2))^2);
        
        if(dis > D0)
            filter(j,k) = 1;
        end
    end
end

% DFT Image
fi = fft2(I);
f_shift = fftshift(fi);

% F.H
filter_apply = f_shift .* filter;

% Inverse DFT
image_orignal=ifftshift(filter_apply);
image_filter_apply=abs(ifft2(image_orignal));
image_filter_apply=uint8(image_filter_apply);


end

