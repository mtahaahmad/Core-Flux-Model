function leg = calculatePathLength(innerCoordinates, outerCoordinates, leg, nFluxLines, top)
% calculates the length of each of the 10 paths in the four legs
% corresponding to the top or bottom rectangles.
%   if top = 1, then legs 1-4 need to be computed, if top = 0, then legs 5-8 need to be computed 

    if top
        legIndex = 1;
    else % bottom
        legIndex = 5;
    end
        
    % We first need to calculate the starting and ending coordinates of
    % each path
    for i = 1:4 % i is the corner number and corner 1 is the lower left corner and then goes clockwise
        slope(i) = (innerCoordinates(i,1) - outerCoordinates(i,1)) / (innerCoordinates(i,2) - outerCoordinates(i,2)); %(xIn - xOut)/(yIn - yOut)
        xIncrement = (innerCoordinates(i,1) - outerCoordinates(i,1)) / (2*nFluxLines);

%         if mod(i,2)
%             c = 1;
%         else
%             c = 2;
%         end

        for n = 1:nFluxLines % n=1 is corresponding to the inner most path, closest to the inner rect
           x(i,n) = outerCoordinates(i,1) + ((2*nFluxLines+1)-2*n) * xIncrement;
           y(i,n) = slope(i)*x(i,n) + innerCoordinates(i,2) - slope(i)*innerCoordinates(i,1);  %outerCoordinates(c,2);
        end
    end
    
    for i = 1:4
        if i == 4
            c = 1;
        else
            c = i+1;
        end
        
        for n = 1:nFluxLines % path1 is the inner most path and increments as you go outwards
           leg(legIndex).path(n).length = sqrt((x(c,n) - x(i,n))^2 + (y(c,n) - y(i,n))^2);
%           disp(leg(legIndex).path(n).length);
           leg(legIndex).path(n).initialCoordinates = [x(i,n) y(i,n)];
%           disp(leg(legIndex).path(n).initialCoordinates);
           leg(legIndex).path(n).finalCoordinates = [x(c,n) y(c,n)];
%           disp(leg(legIndex).path(n).finalCoordinates);
        end
        legIndex = legIndex + 1;
    end
        
end

