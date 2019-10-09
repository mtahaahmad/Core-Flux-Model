function zG = calculateZ(xG, yG, fluxPath, coreWidth, nFluxLines)
%calculates zth component coressponding to x and y coordinates
%   This z component is the fluxDensity

valueAssigned = 0;
fluxPathWidth = coreWidth/nFluxLines;

    if yG >= 0.038
        for i = 1:nFluxLines+1
            for j = 1:4
                if (abs(xG - fluxPath(i).top.coordinates(1, j)) <= fluxPathWidth/2) && (j == 1 || j == 3)
                    if check4yCoordinate(fluxPath(i).top.coordinates(2, j), fluxPath(i).top.coordinates(2, j+1), yG, coreWidth, nFluxLines)
                        zG = fluxPath(i).top.fluxDensity;
                        valueAssigned = 1;
                    end
                elseif (abs(yG - fluxPath(i).top.coordinates(2, j)) <= fluxPathWidth/2) && (j == 2 || j == 4)
                    if check4xCoordinate(fluxPath(i).top.coordinates(1, j), fluxPath(i).top.coordinates(1, j+1), xG, coreWidth, nFluxLines)
                        zG = fluxPath(i).top.fluxDensity;
                        valueAssigned = 1;
                    end
                end
            end
        end
        
        if yG == 0.038
            zG = fluxPath(nFluxLines).top.fluxDensity;
            valueAssigned = 1;
        end
        
        if valueAssigned == 0
            zG = 0;
        end
        
    else % yG < 38
        for i = 1:nFluxLines+1
            for j = 1:4
                if (abs(xG - fluxPath(i).bottom.coordinates(1, j)) <= fluxPathWidth/2) && (j == 1 || j == 3)
                    if check4yCoordinate(fluxPath(i).bottom.coordinates(2, j), fluxPath(i).bottom.coordinates(2, j+1), yG, coreWidth, nFluxLines)
                        zG = fluxPath(i).bottom.fluxDensity;
                        valueAssigned = 1;
                    end
                elseif (abs(yG - fluxPath(i).bottom.coordinates(2, j)) <= fluxPathWidth/2) && (j == 2 || j == 4)
                    if check4xCoordinate(fluxPath(i).bottom.coordinates(1, j), fluxPath(i).bottom.coordinates(1, j+1), xG, coreWidth, nFluxLines)
                        zG = fluxPath(i).bottom.fluxDensity;
                        valueAssigned = 1;
                    end
                end
            end
        end
        
        if yG == 0
            zG = fluxPath(nFluxLines).bottom.fluxDensity;
            valueAssigned = 1;
        end
        
        if valueAssigned == 0
            zG = 0;
        end
    end
        
end

