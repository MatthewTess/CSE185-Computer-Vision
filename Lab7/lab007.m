% name = 'baboon';
% name = 'cameraman';
name = 'checkboard';

I = im2double(imread(sprintf('%s.png', name)));

%% parameters
sigma1 = 1;
sigma2 = 2;
alpha = 0.04;
R_threshold = 1e-5 * 5;

%% apply corner detector
[corner_x, corner_y] = Harris_corner_detector(I, sigma1, sigma2, alpha, R_threshold);


%% visualize results
figure, imshow(I); hold on;
plot(corner_x, corner_y, 'ro');

h = gcf; saveas(h, sprintf('%s_corners.png', name));
function [corner_x, corner_y] = Harris_corner_detector(I, sigma1, sigma2, alpha, R_threshold)
% name = 'baboon';
% name = 'cameraman';
name = 'checkboard';
%% Gaussian kernels
hsize1 = 1 + 2 * ceil(sigma1 * 2);
hsize2 = 1 + 2 * ceil(sigma2 * 2);

gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);
gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);


%% derivative filter
Dx = [1, 0, -1];
Dy = [1; 0; -1];



%% Use derivative of Gaussian to compute x-gradient (Ix) and y-gradient (Iy)
Ix = conv2(I, gaussian_kernel1, 'same');
Ix = conv2(Ix, Dx, 'same');

Iy = conv2(I, gaussian_kernel1, 'same');
Iy = conv2(Iy, Dy, 'same');

figure, imshow(Ix + 0.5);
imwrite(Ix + 0.5, sprintf('%s_Ix.png', name));
figure, imshow(Iy + 0.5);
imwrite(Iy + 0.5, sprintf('%s_Iy.png', name));
%% compute Ixx, Iyy, Ixy
Ixx = Ix .* Ix;
Iyy = Iy .* Iy;
Ixy = Ix .* Iy;



%% compute Sxx, Syy, Sxy
Sxx = conv2(Ixx, gaussian_kernel2, 'same');
Syy = conv2(Iyy, gaussian_kernel2, 'same');
Sxy = conv2(Ixy, gaussian_kernel2, 'same');



%% compute corner response from determine and trace
R = (Sxx.*Syy - Sxy.^2) - alpha * (Sxx + Syy).^2;

figure, imagesc(R); colormap jet; colorbar; axis image;
imwrite(R, sprintf('%s_R.png', name));
%% find corner map with R > R_threshold
corner_map = (R > R_threshold);

figure, imshow(corner_map);
imwrite(corner_map, sprintf('%s_corner_map.png', name));



%% find local maxima of R
local_maxima = imregionalmax(R);

figure, imshow(local_maxima)

imwrite(local_maxima, sprintf('%s_local_maxima.png', name));

%% final corner map and corner x, y coordinates
final_corner_map = (corner_map & local_maxima);

figure, imshow(final_corner_map)
imwrite(final_corner_map, sprintf('%s_final_corner_map.png', name));

[corner_y, corner_x] = find(final_corner_map);
imwrite(insertMarker(I, [corner_y, corner_x], 'color', 'red'), sprintf('%s_corners.png', name));

end