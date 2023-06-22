function filtered_jpg = sobel_filter(img, kernel)

    I2 = zeros(size(img));
    var = 1;
    
    for u = 2 + var: size(img, 2)- var
        for v = 2 + var: size(img, 1)- var
            patch = sum(sum(kernel.*img(v-1: v+1, u-1: u+1)));
            I2(v, u) = patch;
        end
    end
    filtered_jpg = I2;
end
