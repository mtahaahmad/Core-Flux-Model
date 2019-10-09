%% Core dimensions and parameters
close all;
clear all;
clc;
axis([-10 90 -10 90]/1000);
outerDimension = [0 0 63 76]/1000; %% [x y w h]
%%%% The extrusions must be such that the core should remain symmetric %%%%
topExtrusionDimension = [12.5 50.5 38 13]/1000; %% [x y w h]
bottomExtrusionDimension = [12.5 12.5 38 13]/1000; %% [x y w h]
coreDepth = 9.957/1000; %% in millimeters
coreWidth = topExtrusionDimension(1) - outerDimension(1);

materialUnsaturatedRelativePermeability = 3000; %% M-19
materialSaturatedRelativePermeability = 28;
freeSpacePermeability = 4 * pi * 10^-7;
unsaturatedCorePermeability = materialUnsaturatedRelativePermeability * freeSpacePermeability;
saturatedCorePermeability = materialSaturatedRelativePermeability * freeSpacePermeability;
fluxDensityThreshold = 2.4; % saturation after B>2.4T

dcCurrent = 1; %% in amperes
nTurns = 100;
mmf = nTurns * dcCurrent;
nFluxLines = 10; %% minimum flux lines in the thinnest leg of each cross sectional slice of the core 
% currentInCoordinates = [25 50.5]; %% [x y], coordinates must be on the outerDimension or the extrusionDimensions, only one x,y value is reqired
% currentOutCoordinates = [25 25.5]; %% either one of the x or y coordinates must match for currentIn and currentOut, but not both

%%% check4symmetry function needs revision, its doing nothing!
%if ~check4symmetry(topExtrusionDimension, bottomExtrusionDimension) %% Are the two windows symmeteric? if not end the program
%    disp("Core is not symmetric!")
%    return;
%end

% if currentInCoordinates(1) == currentOutCoordinates(1) && currentInCoordinates(2) == currentOutCoordinates(2) %% Error: In and Out can't have same coordinates
%     disp("Wrong winding coordinates"); %% also suspend program
%     return;
% elseif currentInCoordinates(1) ~= currentOutCoordinates(1) && currentInCoordinates(2) ~= currentOutCoordinates(2)
%     disp("Wrong winding coordinates"); %% also suspend program
%     return;
% end %% otherwise coordinates are fine, move on

outerRect = rectangle('position', outerDimension);
topInnerRect = rectangle('position', topExtrusionDimension);
bottomInnerRect = rectangle('position', bottomExtrusionDimension);
hold on

%%
coreLeg = initializeCore(outerDimension,topExtrusionDimension, bottomExtrusionDimension, coreDepth, unsaturatedCorePermeability, nFluxLines);
fluxPath = initializeFluxPath(coreLeg, saturatedCorePermeability, fluxDensityThreshold, nFluxLines);
fluxPath = calculateMagneticEqvCkt(fluxPath, coreLeg, nFluxLines, mmf);
fluxPath = generateFluxLines(coreLeg, fluxPath, nFluxLines);
fluxPath = calculateLeakageFlux(fluxPath, coreWidth, freeSpacePermeability, nFluxLines, mmf);
plotFluxLines(fluxPath, outerDimension, coreWidth, nFluxLines);

