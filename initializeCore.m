function leg = initializeCore(outerDim,innerTopDim, innerBottomDim, coreDepth, permeability, nFluxLines)
% Calculates the quantities of each path
%   There are 8 legs in the core, with each leg divided into 10 paths. Each
%   path has a length, cross-sectional area, permeability, reluctance, and 
%   its initial/final coordinates.
%   The core is divided into 8 legs, top inner rect is surrounded by the
%   first four legs. Leg1 is to the left of the top inner rect and then
%   goes clockwise. Legs 5-8 surround the bottom inner rect. Leg5 is to the
%   left of the bottom inner rect and then goes clockwise.

topInnerCoordinates = calculateCoordinates(innerTopDim, 0); % topInnerCoordinates(1) is the first corner, where (1,1) is the x coordinate and (1,2) is the y coordinate. 0 for inner rect
%disp(topInnerCoordinates);
topOuterCoordinates = calculateCoordinates(outerDim, 1); % 1 for topOuterRect
%disp(topOuterCoordinates);

bottomInnerCoordinates = calculateCoordinates(innerBottomDim, 0); % 0 for inner rect
%disp(bottomInnerCoordinates);
bottomOuterCoordinates = calculateCoordinates(outerDim, 2); % 2 for topOuterRect
%disp(bottomOuterCoordinates);

% Calculate length, csArea and reluctance in each path of the leg, for
% initialization purposes the permeability of each path is the same
leg(1).path(1).length = 0; % for the sake of initialization
leg = calculatePathLength(topInnerCoordinates, topOuterCoordinates, leg, nFluxLines, 1); % 1 for top core, legs 1-4
leg = calculatePathLength(bottomInnerCoordinates, bottomOuterCoordinates, leg, nFluxLines, 0); % 0 for bottom core, legs 5-8

leg = calculatePathCsArea(outerDim, innerTopDim, coreDepth, nFluxLines, leg);
leg = initializePathPermeability(permeability, nFluxLines, leg); % assume every path is unsaturated to start with
leg = calculatePathReluctance(leg, nFluxLines);

end

