function plot_flow(img, u, v)

    % Downsample the velocity matrices by a factor of 10
    u = u(1:10:end, 1:10:end);
    v = v(1:10:end, 1:10:end);

    % Create X and Y coordinate grids using the size of the input image
    [X, Y] = meshgrid(1:size(img, 2), 1:size(img, 1));
    X = X(1:10:end, 1:10:end);
    Y = Y(1:10:end, 1:10:end);

    % Plot the input image and overlay the velocity vectors
    figure, imshow(img);
    hold on;
    quiver(X, Y, u, v, 'y');
    drawnow;
    hold off;

end
