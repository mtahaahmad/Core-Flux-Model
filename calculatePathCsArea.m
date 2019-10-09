function leg = calculatePathCsArea(outerDim, innerTopDim, coreDepth, nFluxLines, leg)
% initializes csArea and updates the leg structure
%   Detailed explanation goes here

pathWidth = abs(outerDim(1) - innerTopDim(1)) / nFluxLines; % in m
csArea = pathWidth * (coreDepth); % in m2

    for i = 1:8
        for n = 1:nFluxLines
            leg(i).path(n).csArea = csArea;
        end
    end
    
end

