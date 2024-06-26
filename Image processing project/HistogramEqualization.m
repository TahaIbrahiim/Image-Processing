function [out]=HistogramEqualization(img)
    [w,h]=size(img);
    hist = zeros(256,1);
    pdf = zeros(256,1);
    cdf = zeros(256,1);
    out= zeros(256,1);
    n = w*h;

    for i = 1 : w
        for j = 1 : h 
            hist(img(i,j)+1)=hist(img(i,j)+1)+1;
            pdf(img(i,j)+1)=hist(img(i,j)+1)/n;
        end
    end

    sum=0;
    L=255;
    for i = 1 : 256
        sum = sum + pdf(i);
        cdf(i) = sum;
        out(i)=round(cdf(i)*L);
    end
bar(out);
end