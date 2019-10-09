function plotFluxLines(fluxPath, outerDimension, coreWidth, nFluxLines)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

%hold on
%     for lines = 1:nFluxLines+1
%         plot(fluxPath(lines).top.coordinates(1,:), fluxPath(lines).top.coordinates(2,:), 'LineWidth', 2);
%         plot(fluxPath(lines).bottom.coordinates(1,:), fluxPath(lines).bottom.coordinates(2,:), 'LineWidth', 2);
%     end
gridResolution = 100;
X = 0:outerDimension(3)/gridResolution:outerDimension(3);
Y = 0:outerDimension(4)/gridResolution:outerDimension(4);
[xGrid, yGrid] = meshgrid(X, Y);
    for i = 1:length(Y) % number of rows
        for j = 1:length(X) % number of columns
            zGrid(i, j) = calculateZ(xGrid(i, j), yGrid(i, j), fluxPath, coreWidth, nFluxLines);
        end
    end
    
    surf(xGrid, yGrid, zGrid);
    colormap jet
    colorbar
end

