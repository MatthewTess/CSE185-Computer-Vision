% read input images
einstein1 = imread('einstein1.jpg');
einstein2 = imread('einstein2.jpg');

% read template image
template = imread('template.jpg');

% calculate SSD
ssd1 = ssd_template_matching(einstein1, template);
ssd2 = ssd_template_matching(einstein2, template);

% set threshold values to test
thresholds = 0:5:200;

% initialize arrays to store results
matches1 = zeros(size(ssd1));
matches2 = zeros(size(ssd2));
num_matches1 = zeros(size(thresholds));
num_matches2 = zeros(size(thresholds));

% loop over threshold values and find matches
for i = 1:length(thresholds)
    threshold = thresholds(i);
    % find matches for einstein1.jpg
    matches1(ssd1 <= threshold) = 1;
    num_matches1(i) = sum(sum(matches1));
    % find matches for einstein2.jpg
    matches2(ssd2 <= threshold) = 1;
    num_matches2(i) = sum(sum(matches2));
end

% find best threshold values
best_threshold1 = thresholds(num_matches1 == max(num_matches1));
best_threshold2 = thresholds(num_matches2 == max(num_matches2));

% plot number of matches vs threshold values
figure;
plot(thresholds, num_matches1, 'r-', thresholds, num_matches2, 'b-');
xlabel('Threshold');
ylabel('Number of matches');
legend('einstein1.jpg', 'einstein2.jpg');
title('Number of matches vs threshold values');

% save output images
imwrite(ssd1, 'einstein1_ssd_output.jpg');
imwrite(matches1, 'einstein1_ssd_match.jpg');
imwrite(ssd2, 'einstein2_ssd_output.jpg');
imwrite(matches2, 'einstein2_ssd_match.jpg');

% function to perform SSD template matching
function [ssd] = ssd_template_matching(image, template)
    % convert images to double precision
    image = im2double(image);
    template = im2double(template);

    % get template size
    [h, w] = size(template);

    % initialize SSD matrix
    ssd = zeros(size(image));

    % loop over all pixels in image
    for i = 1:size(image, 1)-h
        for j = 1:size(image, 2)-w
            % extract region of interest
            roi = image(i:i+h-1, j:j+w-1);
            % calculate SSD
            ssd(i, j) = sum(sum((roi - template).^2));
        end
    end
end
