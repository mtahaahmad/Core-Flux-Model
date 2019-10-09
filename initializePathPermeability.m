function leg = initializePathPermeability(permeability, nFluxLines, leg)
% initialize all paths to default unsaturated permeability
%   Detailed explanation goes here

    for i = 1:8
        for n = 1:nFluxLines
            leg(i).path(n).permeability = permeability;
        end
    end
    
end

