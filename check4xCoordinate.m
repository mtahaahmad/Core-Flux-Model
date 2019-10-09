function out2 = check4xCoordinate(xMin, xMax, xG, coreWidth, nFluxLines)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

delta = coreWidth/(2*nFluxLines);

    if xMin > xMax
        temp = xMax;
        xMax = xMin;
        xMin = temp;
    end
    
    if xMin < (delta/2)
        xMin = 0;
    end

    xMax = xMax + delta;
    xMin = xMin - delta;
    
    if xG >= xMin && xG <= xMax
        out2 = 1;
    else
        out2 = 0;
    end
    
end