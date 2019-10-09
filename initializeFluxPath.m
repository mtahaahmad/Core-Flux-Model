function fluxPath = initializeFluxPath(leg, saturatedPermeability, fluxDensityThreshold, nFluxLines)
% Initialize fluxPath.top and .bottom with csArea, permeability,
% reluctance, saturatedPermeability, saturatedReluctance, fluxThreshold,
% flux, and fluxDensity
%   Detailed explanation goes here

    for i = 1:nFluxLines
        fluxPath(i).top.csArea = leg(1).path(i).csArea;
        fluxPath(i).top.permeability = leg(1).path(i).permeability;
        fluxPath(i).top.reluctance = 0;
        fluxPath(i).top.saturatedPermeability = saturatedPermeability;
        fluxPath(i).top.saturatedReluctance = 0; % to calculate satReluctance = (permeability/satPermeability)*reluctance
        fluxPath(i).top.fluxThreshold = fluxDensityThreshold * fluxPath(i).top.csArea;
        fluxPath(i).top.flux = 0;
        fluxPath(i).top.fluxDensity = 0; % B = flux/csArea
        
        fluxPath(i).bottom.csArea = leg(1).path(i).csArea;
        fluxPath(i).bottom.permeability = leg(1).path(i).permeability;
        fluxPath(i).bottom.reluctance = 0;
        fluxPath(i).bottom.saturatedPermeability = saturatedPermeability;
        fluxPath(i).bottom.saturatedReluctance = 0; % to calculate satReluctance = (permeability/satPermeability)*reluctance
        fluxPath(i).bottom.fluxThreshold = fluxDensityThreshold * fluxPath(i).top.csArea;
        fluxPath(i).bottom.flux = 0;
        fluxPath(i).bottom.fluxDensity = 0; % B = flux/csArea
    end
    
end

