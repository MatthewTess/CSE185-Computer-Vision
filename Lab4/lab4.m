clear all;

%% Task 1: Separate Frequency
name = "lena.jpg";
ratio = 0.1;
[low_pass_img, high_pass_img] = separate_frequency(name, ratio);
imwrite(low_pass_img + 0.5, "lena_low_pass_01.jpg");
imwrite(high_pass_img + 0.5, "lena_high_pass_01.jpg");

ratio = 0.2;
[low_pass_img, high_pass_img] = separate_frequency("lena.jpg", ratio);
imwrite(low_pass_img, "lena_low_pass_02.jpg");
imwrite(high_pass_img, "lena_high_pass_02.jpg");

%% Task 2: Hybrid Image
name1 = "marilyn.jpg"; 
name2 = "einstein.jpg";
img1 = im2double(imread(name1));
img2 = im2double(imread(name2));
ratio = 0.5;
img_merged1 = hybrid_image(name1, name2, ratio);
img_merged2 = hybrid_image(name2, name1, ratio);
img_merged1 = rgb2gray(img_merged1);
img_merged2 = rgb2gray(img_merged2);
imwrite(img_merged1, "hybrid_1.jpg");
imwrite(img_merged2, "hybrid_2.jpg");
s