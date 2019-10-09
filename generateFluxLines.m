function fluxPath = generateFluxLines(coreLeg, fluxPath, nFluxLines)
% Calculates the complete flux path coordinates around the top and bottom
% windows
%   Detailed explanation goes here

    for line = 1:nFluxLines
        for i = 1:4 % corresponding to corners, i=1 is the lower left corner of the rect and then goes clockwise
            for j = 1:2 % j=1 is xCoordinate and j=2 is yCoordinate
                fluxPath(line).top.coordinates(j, i) = coreLeg(i).path(line).initialCoordinates(j);
                fluxPath(line).bottom.coordinates(j, i) = coreLeg(i+4).path(line).initialCoordinates(j);
                if i == 4
                    fluxPath(line).top.coordinates(j, i+1) = coreLeg(i).path(line).finalCoordinates(j);
                    fluxPath(line).bottom.coordinates(j, i+1) = coreLeg(i+4).path(line).finalCoordinates(j);
                end
            end
        end
    end
    
end

