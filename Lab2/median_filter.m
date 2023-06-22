%% question 3
% Load the image
img = imread('lena_noisy.jpg');

% Get the size of the image
[rows, cols, channels] = size(img);

% Create an empty output image with the same number of channels as the input image
filtered_img = uint8(zeros(rows, cols, channels));

% Set the patch size
patch_size = 3;

% Loop through each pixel of the output image
for x = 1:rows
    for y = 1:cols
        % Extract the patch of pixels around the current pixel
        patch = zeros(patch_size^2, channels);
        patch_index = 1;
        for patch_x = x-(patch_size-1)/2:x+(patch_size-1)/2
            for patch_y = y-(patch_size-1)/2:y+(patch_size-1)/2
                if patch_x >= 1 && patch_x <= rows && patch_y >= 1 && patch_y <= cols
                    for c = 1:channels
                        patch(patch_index, c) = img(patch_x, patch_y, c);
                    end
                    patch_index = patch_index + 1;
                end
            end
        end
        
        % Sort the patch values along each channel
        patch = sort(patch, 1);
        
        % Find the median value of the patch along each channel
        median_value = patch(floor(patch_index/2), :);
        
        % Set the filtered pixel value to the median value
        for c = 1:channels
            filtered_img(x, y, c) = median_value(c);
        end
    end
end

% Save the filtered image
imwrite(filtered_img, 'median_0.jpg');
%% question 4
% Load the image
img = imread('lena_noisy.jpg');

% Get the size of the image
[rows, cols, channels] = size(img);

% Create an empty output image with the same number of channels as the input image
filtered_img = uint8(zeros(rows, cols, channels));

% Set the patch size
patch_size = 5;

% Loop through each pixel of the output image
for x = 1:rows
    for y = 1:cols
        % Extract the patch of pixels around the current pixel
        patch = zeros(patch_size^2, channels);
        patch_index = 1;
        for patch_x = x-(patch_size-1)/2:x+(patch_size-1)/2
            for patch_y = y-(patch_size-1)/2:y+(patch_size-1)/2
                if patch_x >= 1 && patch_x <= rows && patch_y >= 1 && patch_y <= cols
                    for c = 1:channels
                        patch(patch_index, c) = img(patch_x, patch_y, c);
                    end
                    patch_index = patch_index + 1;
                end
            end
        end
        
        % Sort the patch values along each channel
        patch = sort(patch, 1);
        
        % Find the median value of the patch along each channel
        median_value = patch(floor(patch_index/2), :);
        
        % Set the filtered pixel value to the median value
        for c = 1:channels
            filtered_img(x, y, c) = median_value(c);
        end
    end
end

% Save the filtered image
imwrite(filtered_img, 'median_1.jpg');