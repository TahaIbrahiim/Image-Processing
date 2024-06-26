function noisyImage = addRayleighNoise(image, scaleParameter)
    image=double(image);
    % Generate Rayleigh noise with specified scale parameter
    noise = scaleParameter * randn(size(image));
    
    % Add the generated noise to the original image
    noisyImage = image + noise;
    
    % Clip values to be in the valid intensity range [0, 255]
    noisyImage = max(0, min(noisyImage, 255));
    
    % Convert to uint8 if the input image is of integer type
    if isinteger(image)
        noisyImage = uint8(noisyImage);
    end
end
