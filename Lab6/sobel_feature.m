function [magnitude, orientation] = sobel_feature(img)

Hy = [1 2 1; 0 0 0; -1 -2 -1];
Hx = [1 0 -1; 2 0 -2; 1 0 -1];

%I = im2double(img);

Gy =  conv2(double(img),Hy, 'same');
Gx =  conv2(double(img),Hx, 'same');

magnitude = sqrt(Gy.*Gy + Gx.*Gx);
orientation = atan(Gy./Gx); % atan = tan^-1

end