function filtered_jpg = gaussian_filter(img, hsize, sigma)

    kernel = fspecial('gaussian', hsize, sigma);
    var = floor(hsize/2);
    for u = 1 : size(img, 2)
        for v = 1 : size(img, 1)
            x1 = u - var; x2 = u + var;
            y1 = v - var; y2 = v + var;
            
            if ((x1 > 1) && (x2 < (size(img, 2) - var)) && (y1 > 1) && (y2 < (size(img, 1) - var))  )
                patch = img(y1:y2, x1:x2);
                value = patch .* kernel;
                value = sum(value(:));
            else
                value = img(v,u);
            end
            
            filtered_jpg(v, u) = value;
        end
    end
end