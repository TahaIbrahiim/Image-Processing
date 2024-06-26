function result = Convolution(image, filter)
    image = double(image);
    % Get dimensions of the image and kernel
    [imageHeight, imageWidth] = size(image);
    [kernelHeight, kernelWidth] = size(filter);
    
    paddedImage = padarray(image, [floor(kernelHeight/2), floor(kernelWidth/2)], 'replicate', 'both');
    
    result = zeros(size(image));
    
    for i = 1:imageHeight
        for j = 1:imageWidth
            % Extract the region of interest (ROI) from the padded image
            subim = paddedImage(i:i+kernelHeight-1, j:j+kernelWidth-1);
            
            % Perform element-wise multiplication and sum to get the result
            result(i, j) = sum(subim .* filter);
        end
    end
    result = uint8(result);
end


