function [ n ] = Fourier( a )
f1 = fft2(a);
f2 = fftshift(f1);
n = abs(f2);
n = log(1 + n);
n = mat2gray(n);
end

