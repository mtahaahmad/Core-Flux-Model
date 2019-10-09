function fluxPath = calculateLeakageFlux(fluxPath, coreWidth, freeSpacePermeability, nFluxLines, mmf)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
xIncrement = coreWidth/nFluxLines;

    fluxPath(nFluxLines+1).top.coordinates(1, 1) = fluxPath(1).top.coordinates(1, 1) + xIncrement;
    fluxPath(nFluxLines+1).top.coordinates(2, 1) = fluxPath(1).top.coordinates(2, 1);

    fluxPath(nFluxLines+1).top.coordinates(1, 2) = fluxPath(1).top.coordinates(1, 1) + xIncrement;
    fluxPath(nFluxLines+1).top.coordinates(2, 2) = fluxPath(1).top.coordinates(2, 1) + xIncrement;

    fluxPath(nFluxLines+1).top.coordinates(1, 3) = fluxPath(1).top.coordinates(1, 4) - xIncrement;
    fluxPath(nFluxLines+1).top.coordinates(2, 3) = fluxPath(1).top.coordinates(2, 4) + xIncrement;

    fluxPath(nFluxLines+1).top.coordinates(1, 4) = fluxPath(1).top.coordinates(1, 4) - xIncrement;
    fluxPath(nFluxLines+1).top.coordinates(2, 4) = fluxPath(1).top.coordinates(2, 4);
    
    fluxPath(nFluxLines+1).top.coordinates(1, 5) = fluxPath(1).top.coordinates(1, 1) + xIncrement;
    fluxPath(nFluxLines+1).top.coordinates(2, 5) = fluxPath(1).top.coordinates(2, 1);
    
    fluxPath(nFluxLines+1).top.reluctance = 38 / (freeSpacePermeability * fluxPath(1).top.csArea);
    fluxPath(nFluxLines+1).top.flux = mmf / fluxPath(nFluxLines+1).top.reluctance;
    fluxPath(nFluxLines+1).top.fluxDensity = fluxPath(nFluxLines+1).top.flux / fluxPath(1).top.csArea;
    
    %bottom
    fluxPath(nFluxLines+1).bottom.coordinates(1, 1) = fluxPath(1).bottom.coordinates(1, 2) + xIncrement;
    fluxPath(nFluxLines+1).bottom.coordinates(2, 1) = fluxPath(1).bottom.coordinates(2, 2);

    fluxPath(nFluxLines+1).bottom.coordinates(1, 2) = fluxPath(1).bottom.coordinates(1, 2) + xIncrement;
    fluxPath(nFluxLines+1).bottom.coordinates(2, 2) = fluxPath(1).bottom.coordinates(2, 2) - xIncrement;

    fluxPath(nFluxLines+1).bottom.coordinates(1, 3) = fluxPath(1).bottom.coordinates(1, 3) - xIncrement;
    fluxPath(nFluxLines+1).bottom.coordinates(2, 3) = fluxPath(1).bottom.coordinates(2, 3) - xIncrement;

    fluxPath(nFluxLines+1).bottom.coordinates(1, 4) = fluxPath(1).bottom.coordinates(1, 3) - xIncrement;
    fluxPath(nFluxLines+1).bottom.coordinates(2, 4) = fluxPath(1).bottom.coordinates(2, 3);
    
    fluxPath(nFluxLines+1).bottom.coordinates(1, 5) = fluxPath(1).bottom.coordinates(1, 2) + xIncrement;
    fluxPath(nFluxLines+1).bottom.coordinates(2, 5) = fluxPath(1).bottom.coordinates(2, 2);
    
    fluxPath(nFluxLines+1).bottom.reluctance = 38 / (freeSpacePermeability * fluxPath(1).bottom.csArea);
    fluxPath(nFluxLines+1).bottom.flux = mmf / fluxPath(nFluxLines+1).bottom.reluctance;
    fluxPath(nFluxLines+1).bottom.fluxDensity = fluxPath(nFluxLines+1).bottom.flux / fluxPath(1).bottom.csArea;
    
end

