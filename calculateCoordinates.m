function returnCoordinates = calculateCoordinates(dim, rect)
% returns corner coordinates for the given dimension, the first coordinate
% is the lower left corner of the rect and then it goes clockwise
%   rect = 0 if the coordintes are being calculated for any of the
%   inner rectangles, otherwise outerTopRect = 1, and outerBottomRect = 2

    if ~rect %% inner rect
        returnCoordinates(1, 1:2) = [dim(1) dim(2)];
        returnCoordinates(2, 1:2) = [dim(1) dim(2)+dim(4)];
        returnCoordinates(3, 1:2) = [dim(1)+dim(3) dim(2)+dim(4)];
        returnCoordinates(4, 1:2) = [dim(1)+dim(3) dim(2)];
    elseif rect == 1 %%outerTopRect
        returnCoordinates(1, 1:2) = [dim(1) dim(2)+dim(4)/2];
        returnCoordinates(2, 1:2) = [dim(1) dim(2)+dim(4)];
        returnCoordinates(3, 1:2) = [dim(1)+dim(3) dim(2)+dim(4)];
        returnCoordinates(4, 1:2) = [dim(1)+dim(3) dim(2)+dim(4)/2];
    elseif rect == 2 %%outerBottomRect
        returnCoordinates(1, 1:2) = [dim(1) dim(2)];
        returnCoordinates(2, 1:2) = [dim(1) dim(2)+dim(4)/2];
        returnCoordinates(3, 1:2) = [dim(1)+dim(3) dim(2)+dim(4)/2];
        returnCoordinates(4, 1:2) = [dim(1)+dim(3) dim(2)];
    end

end

