function result = max_filter(image, filterSize)
    [imageHeight, imageWidth] = size(image);
    result = zeros(size(image)); 
    halfFilterSize = floor(filterSize/2);
    paddedImage = padarray(image, [halfFilterSize, halfFilterSize], 'replicate', 'both');
    
    for i = 1:imageHeight
        for j = 1:imageWidth
            % Extract the region of interest (ROI) from the padded image
            roi = paddedImage(i:i+filterSize-1, j:j+filterSize-1);
            % Apply the max filter operation
            result(i, j) = max(roi(:));
        end
    end
    result = uint8(result);
end
