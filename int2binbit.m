function [ binaryArray ] = int2binbit( numberinInt, numOfBits )
% int2binbit convert the Integer in to binary array.
%   It takes arguments as numberinInt an integer value, number of bits to
%   pair with.
temp = double(numberinInt);
k = 1; 
binaryArray = zerows(numOfBits);
while temp>0
    binaryArray(k) = mod(temp,2);
    temp = floor(temp/2);
    k = k+1;
end
arrayLength = length( binaryArray);
if arrayLength < numOfBits
    additionalBits = numOfBits - arrayLength;
    for k = arrayLength+1:(arrayLength + additionalBits)
        binaryArray(k) = 0;
    end
end
binaryArray = flip(binaryArray);
end

