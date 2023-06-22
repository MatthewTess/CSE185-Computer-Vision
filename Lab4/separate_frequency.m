function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
%% apply FFT
input_image = im2double(imread(img));
FT_img = fft2(im2double(input_image));

%% shift
frequency_map_shifted = fftshift(FT_img);

%% compute low-frequency mask

% M : no of rows (height of the image)
% N : no of columns (width of the image)
[M, N] = size(input_image, [1 2]);
  
% Assign Cut-off Frequency  
D0 = 20 + ratio; 
  
% Computing mask with formula
u = 0:(M-1);
idx = find(u>M/2);
u(idx) = u(idx)-M;
v = 0:(N-1);
idy = find(v>N/2);
v(idy) = v(idy)-N;
  
[V, U] = meshgrid(v, u);
  
D = sqrt(U.^2+V.^2);

%% separate low-frequency and high-frequency maps
%% Comparing with the cut-off frequency

hmask = double(D > D0);

lmask = double(D <= D0);

high_frequency_map = hmask.*FT_img;
low_frequency_map = lmask.*FT_img;    

%% shift frequency maps back
hfrequency_map = ifftshift(high_frequency_map)
lfrequency_map = ifftshift(low_frequency_map)

%% apply Inverse FFT
high_pass_img = real(ifft2(double(high_frequency_map)));
low_pass_img = real(ifft2(double(low_frequency_map)));
imshow(high_pass_img);
imshow(low_pass_img);

end
