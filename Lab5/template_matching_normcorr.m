% read input images
einstein1 = imread('einstein1.jpg');
einstein2 = imread('einstein2.jpg');

% read template image
template = imread('template.jpg');

% calculate normalized correlation
nc1 = normcorr_template_matching(einstein1, template);
nc2 = normcorr_template_matching(einstein2, template);

% set threshold values to test
thresholds = 0:0.05:1;

% initialize arrays to store results
matches1 = zeros(size(nc1));
matches2 = zeros(size(nc2));
num_matches1 = zeros(size(thresholds));
num_matches2 = zeros(size(thresholds));

% loop over threshold values and find matches
for i = 1:length(thresholds)
    threshold = thresholds(i);
    % find matches for einstein1.jpg
    matches1(nc1 >= threshold) = 1;
    num_matches1(i) = sum(sum(matches1));
    % find matches for einstein2.jpg
    matches2(nc2 >= threshold) = 1;
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
imwrite(nc1, 'einstein1_normcorr_output.jpg');
imwrite(matches1, 'einstein1_normcorr_match.jpg');
imwrite(nc2, 'einstein2_normcorr_output.jpg');
imwrite(matches2, 'einstein2_normcorr_match.jpg');

% function to perform normalized correlation template matching
function [nc] = normcorr_template_matching(image, template)
    % convert images to double precision
    image = im2double(image);
    template = im2double(template);

    % get template size
    [h, w] = size(template);

    % calculate mean of template
    template_mean = mean(template(:));

    % subtract mean from template
    template = template - template_mean;

    % initialize normalized correlation matrix
    nc = zeros(size(image));

    % loop over all pixels in image
    for i = 1:size(image, 1)-h
        for j = 1:size(image, 2)-w
            % extract region of interest
            roi = image(i:i+h-1, j:j+w-1);
            % subtract mean from roi
            roi_mean = mean(roi(:));
            roi = roi - roi_mean;
            % calculate normalized correlation
            nc(i, j) = sum(sum(roi .* template)) / sqrt(sum(sum(roi.^2)) * sum(sum(template.^2)));
        end
    end
end
