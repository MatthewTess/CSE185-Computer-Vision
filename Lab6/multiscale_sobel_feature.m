function feature = multiscale_sobel_feature(img, scale)
% initialize feature vector
feature = [];
for i = 1:scale
% compute sobel feature
f = sobel_feature(img);
% concatenate feature vector
feature = cat(1, feature, f(:));
% down-sample image by 2
feature = feature(1:2:end,1:2:end);
end
end