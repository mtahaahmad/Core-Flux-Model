function fluxPath = updateFluxPath(fluxPath, nFluxLines)
% updates .saturatedFlux, .flux, and .fluxDensity
%   Detailed explanation goes here

    for i = 1:nFluxLines
       permeability = fluxPath(i).top.permeability;
       satPermeability = fluxPath(i).top.saturatedPermeability;
       reluctance = fluxPath(i).top.reluctance;
       fluxPath(i).top.saturatedReluctance = (permeability / satPermeability) * reluctance;
       
       if fluxPath(i).top.flux > fluxPath(i).top.fluxThreshold
           excessFlux = fluxPath(i).top.flux - fluxPath(i).top.fluxThreshold;
           fluxPath(i).top.flux = fluxPath(i).top.fluxThreshold + (excessFlux * reluctance)/fluxPath(i).top.saturatedReluctance;
       end
       fluxPath(i).top.fluxDensity = fluxPath(i).top.flux / fluxPath(i).top.csArea;
%       disp(fluxPath(i).top.fluxDensity);
       
       % for bottom
       permeability = fluxPath(i).bottom.permeability;
       satPermeability = fluxPath(i).bottom.saturatedPermeability;
       reluctance = fluxPath(i).bottom.reluctance;
       fluxPath(i).bottom.saturatedReluctance = (permeability / satPermeability) * reluctance;
       
       if fluxPath(i).bottom.flux > fluxPath(i).bottom.fluxThreshold
           excessFlux = fluxPath(i).bottom.flux - fluxPath(i).bottom.fluxThreshold;
           fluxPath(i).bottom.flux = fluxPath(i).bottom.fluxThreshold + (excessFlux * reluctance)/fluxPath(i).bottom.saturatedReluctance;
       end
       fluxPath(i).bottom.fluxDensity = fluxPath(i).bottom.flux / fluxPath(i).bottom.csArea;
%       disp(fluxPath(i).bottom.fluxDensity);
    end
end

