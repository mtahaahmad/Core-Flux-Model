function symmetry = check4symmetry(topDim, bottomDim)
%Checks for core symmetry
%   Detailed explanation goes here

    if (topDim(1) == bottomDim(1) || topDim(2) == bottomDim(2)) && topDim(3:4) == bottomDim(3:4)
        symmetry = 1;
    else
        symmetry = 0;
    end

end

