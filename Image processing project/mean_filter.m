function result = mean_filter(image, filterSize)
    [imageHeight, imageWidth] = size(image);
    result = zeros(size(image));
    halfFilterSize = floor(filterSize/2);
    paddedImage = padarray(image, [halfFilterSize, halfFilterSize], 'replicate', 'both');
   
    for i = 1:imageHeight
        for j = 1:imageWidth
            % Extract the region of interest (ROI) from the padded image
            roi = reshape(paddedImage(i:i+filterSize-1, j:j+filterSize-1),[],1);
            % Apply the mean filter operation
            s=sum(roi);
            result(i,j)=s/(filterSize * filterSize);
        end
    end
    result = uint8(result);
end
