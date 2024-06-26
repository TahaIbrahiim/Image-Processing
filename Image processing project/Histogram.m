function arr = Histogram(im)

arr = zeros(256, 1);
[H, W] = size(im);

for i = 1:H
    for j = 1:W
        arr(im(i, j) + 1) = arr(im(i, j) + 1) + 1;
    end
end

bar(arr);

end
