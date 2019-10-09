function leg = calculatePathReluctance(leg, nFluxLines)
% Assign each path with its corresponding reluctance
%   all paths have their length, csArea, and permeability assigned already, use R = l/(uA) 

    for i = 1:8
        for n = 1:nFluxLines
            l = leg(i).path(n).length;
            u = leg(i).path(n).permeability;
            A = leg(i).path(n).csArea;
            leg(i).path(n).reluctance = l / (u*A);
        end
    end
    
end

