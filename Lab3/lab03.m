jpg_one = im2double(imread('lena_noisy.jpg'));
jpg_two = im2double(imread('lena.jpg'));
% 
%% Median filter
patch_size = [3, 3];
patch_size1= [5, 5];

jpg_average = median_filter(jpg_one, patch_size);
jpg_average_two = median_filter(jpg_one, patch_size1);
figure, imshow(jpg_average);
figure, imshow(jpg_average_two);
imwrite(jpg_average, 'median_3.jpg');
imwrite(jpg_average_two, 'median_5.jpg');

%% Sobel filter
 H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; 
 h = [1, 0, -1; 2, 0, -2; 1, 0, -1]; 

sobel_jpg = sobel_filter(jpg_two, H);
sobel_jpg_two = sobel_filter(jpg_two, h);
figure, imshow(sobel_jpg);
figure, imshow(sobel_jpg_two);
imwrite(sobel_jpg, 'sobel_h.jpg');
imwrite(sobel_jpg_two, 'sobel_v.jpg');


%% Gaussian filter
hsize = 5; sigma = 2;
hsize1 = 9; sigma1 = 4;

gaussian_jpg = gaussian_filter(jpg_two,hsize,sigma);
gaussian_jpg_two = gaussian_filter(jpg_two,hsize1,sigma1);
figure,imshow(gaussian_jpg);
figure,imshow(gaussian_jpg_two);
imwrite(gaussian_jpg, 'gaussian_5.jpg');
imwrite(gaussian_jpg_two, 'gaussian_9.jpg');

