function [ Img ] = IFFT2( FImg )

[M, N] = size(FImg);
Img = zeros(M, N);
ro = 0;
co = 0;

for x = 1:M
    for y = 1:N
        for u = 1:M
            for v = 1:N
                co = co + FImg(u, v) * exp(1i * (2) * pi * (((x - 1) * (u - 1) / M) + ((y - 1) * (v - 1) / N)));
            end
            ro = ro + co;
            co = 0;
        end
        Img(x, y) = ro / (M * N);
        ro = 0;
        co = 0;
        
    end
end

Img = abs(Img);
Img = mat2gray(Img);

end

