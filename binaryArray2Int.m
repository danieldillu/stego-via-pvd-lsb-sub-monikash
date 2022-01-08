function [ intVal ] = binaryArray2Int( binaryValue )
%binaryArray2Int Summary of this function goes here
%   Detailed explanation goes here
intVal = 0;
for i = 1:length(binaryValue)
    intVal = intVal + binaryValue(i) * power(2,i-1);
end
end

