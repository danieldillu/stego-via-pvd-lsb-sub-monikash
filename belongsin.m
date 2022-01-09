function [ logicalReturnValue ] = belongsin( number, rangeLowerValue, rangeUpperValue )
% belongsin Summary of this function goes here
%   Detailed explanation goes here
if number >= rangeLowerValue && number <= rangeUpperValue
    logicalReturnValue = true;
else
    logicalReturnValue = false;
end

end

