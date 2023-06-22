%% 1 Set green channel to zero, and save as green.jpg
% Read in the image
img = imread('im1.jpg');

% Set the green channel to zero
img(:,:,2) = 0;

% Save the modified image
imwrite(img, 'green.jpg');
%% 2Convert image from RGB to gray scale without using 
% built-in functions, and save as gray.jpg
% Read in the image
% Read in the image
% Read in the image
img = imread('im1.jpg');

% Get the size of the image
[rows, cols, channels] = size(img);

% Create an empty grayscale image
grayImg = zeros(rows, cols);

% Convert the image to grayscale using the weighted average method
for i = 1:rows
    for j = 1:cols
        grayImg(i,j) = 0.2989 * img(i,j,1) + 0.5870 * img(i,j,2) + 0.1140 * img(i,j,3);
    end
end
gray_img = rgb2gray(img); 

% Save the grayscale image
imwrite(gray_img, 'gray.jpg');
%% 3 Rotate 90 degrees, and save as rotate.jpg
img = imread('im1.jpg');  %read image
rotated_img = imrotate(img,90);   %rotate the image 90 degrees
imshow(rotated_img);           %display image
imwrite(rotated_img, 'rotate.jpg'); %save image
%% 4 Crop the image given the upper left point (30, 100) and 
% lower right point (270, 300), and save as crop.jpg
img = imread('im1.jpg');  %read image
cropped_img = imcrop(img,[30 100 270-30 300-100]); % Crop the image using the given coordinates
imshow(cropped_img);           %display image
imwrite(cropped_img, 'crop.jpg'); %save image

%% 5 Horizontally flip the image, and save as flip.jpg
img = imread('im1.jpg');  %read image
flipped_img = fliplr(img);   %flip image horizontally using fliplr function
imshow(flipped_img);           %display image
imwrite(flipped_img, 'flip.jpg'); %save image
%% 6  Combine 4 images (01.jpg ~ 04.jpg) into one matrix 
% with 2 x 2 grid and 10 pixels separations, and save as 
% combine.jpg
img1 = imread('im1.jpg');
img2 = imread('im2.jpg');
img3 = imread('im3.jpg');
img4 = imread('im4.jpg');
imresize(img1, [300 400]);
imresize(img2, [300 400]);
imresize(img3, [300 400]);
imresize(img4, [300 400]);
% Get the size of the individual images
[row1, col1,~] = size(img1);
[row2, col2,~] = size(img2);
[row3, col3,~] = size(img3);
[row4, col4,~] = size(img2);

% Create a empty matrix with the size of the final image
final_img = uint8(zeros(max(row1,row2)*2+10,col1+col2+10,3));

% Copy the images into the final image
final_img(1:row1, 1:col1,:) = img1;
final_img(1:row2, col1+11:col1+col2+10,:) = img2;
final_img(row1+11:row1+row2+10, 1:col1,:) = img3;
final_img(row1+11:row1+row2+10, col1+11:col1+col2+10,:) = img4;

imshow(final_img);           %display image
imwrite(final_img, 'combine.jpg'); %save image
%% 7
% Read the images
img1 = imread('im1.jpg');
img2 = imread('im2.jpg');
% Convert the images to vectors
img1_vec = reshape(img1,[],1);
img2_vec = reshape(img2,[],1);

% Average the vectors
average_vec = (img1_vec + img2_vec) / 2;

% Convert the average vector back to an image
average_img = reshape(average_vec, size(img1,1), size(img1,2), size(img1,3));

% Save the image
imwrite(average_img, 'average.jpg');
imshow('average.jpg');
