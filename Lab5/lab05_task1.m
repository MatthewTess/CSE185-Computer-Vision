% read input image
input_img = imread('lena.jpg');

% define number of pyramid levels
num_levels = 5;

% initialize Gaussian pyramid
gaussian_pyramid = cell(num_levels, 1);

% initialize Laplacian pyramid
laplacian_pyramid = cell(num_levels, 1);

% build Gaussian pyramid
gaussian_pyramid{1} = input_img;
for i = 2:num_levels
    % apply Gaussian smoothing
    filtered_img = imgaussfilt(gaussian_pyramid{i-1}, 2^(i-2));
    % downsample by a factor of 2
    downsampled_img = filtered_img(1:2:end, 1:2:end, :);
    % store in pyramid
    gaussian_pyramid{i} = downsampled_img;
end

% build Laplacian pyramid
laplacian_pyramid{num_levels} = gaussian_pyramid{num_levels};
for i = num_levels-1:-1:1
    % upsample previous level
    upsampled_img = imresize(gaussian_pyramid{i+1}, size(gaussian_pyramid{i}), 'bilinear');
    % subtract from current level
    laplacian_pyramid{i} = gaussian_pyramid{i} - upsampled_img;
end

% save pyramid levels as images
for i = 1:num_levels
    % Gaussian pyramid
    gaussian_img = gaussian_pyramid{i};
    imwrite(gaussian_img, sprintf('Gaussian_scale%d.jpg', i));
    % Laplacian pyramid
    laplacian_img = laplacian_pyramid{i};
    imwrite(laplacian_img, sprintf('Laplacian_scale%d.jpg', i));
end
