function img_merged = hybrid_image(img1, img2, ratio)
%% split img1 and img2 into low/high frequency 
[low_f_img1, high_f_img1] = separate_frequency(img1, ratio);
[low_f_img2 , high_f_img2] = separate_frequency(img2, ratio);

%% combine the low-frequency map of img1 with the high-frequency map of img2
img_merged = imfuse(high_f_img1, low_f_img2);
end
