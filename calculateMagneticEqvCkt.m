function fluxPath = calculateMagneticEqvCkt(fluxPath, coreLeg, nFluxLines, mmf)
% calculates the reluctance of the complete path and its corresponding
% flux. Remember their are nFluxLines (paths) surrounding each window.
%   Detailed explanation goes here

    for line = 1:nFluxLines
        for i = 1:4 % corresponding to corners, i=1 is the lower left corner of the rect and then goes clockwise
            % calculate path reluctances first
            fluxPath(line).top.reluctance = fluxPath(line).top.reluctance + coreLeg(i).path(line).reluctance;
            fluxPath(line).bottom.reluctance = fluxPath(line).bottom.reluctance + coreLeg(i+4).path(line).reluctance;
        end
        % calculate the flux in each path
        fluxPath(line).top.flux = mmf / fluxPath(line).top.reluctance;
        fluxPath(line).bottom.flux = mmf / fluxPath(line).bottom.reluctance;
    end
    
    fluxPath = updateFluxPath(fluxPath, nFluxLines);
    
end

