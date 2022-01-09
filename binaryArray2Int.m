function [ intVal ] = binaryArray2Int( binaryValue )
%binaryArray2Int converts to Integers
%   binaryArray2Int takes an input of a array of binary of and
%   returns as an Integer value of it.
intVal = 0;
temp = flip(binaryValue);
for i = 1:length(temp)
    intVal = intVal + temp(i) * power(2,i-1);
end
end

