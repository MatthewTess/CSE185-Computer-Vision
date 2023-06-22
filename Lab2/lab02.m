%%question 1 
% Load the image
img = imread('01.jpg');

% Get the size of the image
[rows, cols, channels] = size(img);

% Create an empty output image with the same number of channels as the input image
rotated_img = uint8(zeros(rows, cols, channels));

% Calculate the center of the image
center_x = floor(rows/2);
center_y = floor(cols/2);

% Angle of rotation in radians
angle = 45 * pi / 180;

% Loop through each pixel of the output image
for x = 1:rows
    for y = 1:cols
        % Calculate the source pixel position for forward warping
        source_x = (x - center_x) * cos(angle) - (y - center_y) * sin(angle) + center_x;
        source_y = (x - center_x) * sin(angle) + (y - center_y) * cos(angle) + center_y;
        
        % Check if the source pixel position is within the bounds of the input image
        if source_x >= 1 && source_x <= rows && source_y >= 1 && source_y <= cols
            % Interpolate the color values using nearest neighbor interpolation
            source_x = round(source_x);
            source_y = round(source_y);
            for c = 1:channels
                rotated_img(x, y, c) = img(source_x, source_y, c);
            end
        end
    end
end

% Save the rotated image
imwrite(rotated_img, 'rotate_0.jpg');
%% question 2
% Load the image
img = imread('01.jpg');

% Get the size of the image
[rows, cols, channels] = size(img);

% Create an empty output image with the same number of channels as the input image
rotated_img = uint8(zeros(rows, cols, channels));

% Calculate the center of the image
center_x = floor(rows/2);
center_y = floor(cols/2);

% Angle of rotation in radians
angle = 45 * pi / 180;

% Loop through each pixel of the input image
for x = 1:rows
    for y = 1:cols
        % Calculate the destination pixel position for backward warping
        dest_x = (x - center_x) * cos(angle) + (y - center_y) * sin(angle) + center_x;
        dest_y = -(x - center_x) * sin(angle) + (y - center_y) * cos(angle) + center_y;
        
        % Check if the destination pixel position is within the bounds of the output image
        if dest_x >= 1 && dest_x <= rows && dest_y >= 1 && dest_y <= cols
            % Interpolate the color values using nearest neighbor interpolation
            dest_x = round(dest_x);
            dest_y = round(dest_y);
            for c = 1:channels
                rotated_img(dest_x, dest_y, c) = img(x, y, c);
            end
        end
    end
end

% Save the rotated image
imwrite(rotated_img, 'rotate_1.jpg');

