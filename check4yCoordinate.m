function out1 = check4yCoordinate(yMin, yMax, yG, coreWidth, nFluxLines)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

delta = coreWidth/(2*nFluxLines);

    if yMin > yMax
        temp = yMax;
        yMax = yMin;
        yMin = temp;
    end
    
    if yMin < (delta/2)
        yMin = 0;
    end

    yMax = yMax + delta;
    yMin = yMin - delta;
    
    if yG >= yMin && yG <= yMax
        out1 = 1;
    else
        out1 = 0;
    end
    
end

