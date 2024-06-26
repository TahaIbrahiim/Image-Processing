function [ FImg ] = FFT2( Img )

[M, N] = size(Img);
FImg = zeros(M, N);
DImg = double(Img);
ro = 0;
co = 0;

for x = 1:M
    for y = 1:N
        for u = 1:M
            for v = 1:N
                co = co + DImg(u, v) * exp(1i * (-2) * pi * (((x - 1) * (u - 1) / M) + ((y - 1) * (v - 1) / N)));
            end
            ro = ro + co;
            co = 0;
        end
        FImg(x, y) = ro;
        ro = 0;
        co = 0;
        
    end
end

magnitude = fftshift(FImg);
magnitude = abs(magnitude);
magnitude = log(1 + magnitude);
magnitude = mat2gray(magnitude);

imshow(magnitude);

end

