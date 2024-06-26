function [ f3 ] = Inverse_Fourier( f )
f = fftshift(f);
f3 = ifft2(f);
f3 = abs(f3);
f3 = mat2gray(f3);
end

