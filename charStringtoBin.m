function [ binarystring ] = charStringtoBin( stegoText )
%charStringtoBin convert string of characters to binary returns a 2D array
%   It takes a input of String of charcacters, traverses the characters and
%   converts to binary in row-wise. It should be noted that the bit length
%   of the ASCII value is not always equals, it may be 6 bit or more. This
%   is returned end of the function.
sz = length(stegoText);
maxbit = 0;
for j=1:sz
    if length(de2bi(int16(stegoText(j))))>maxbit
        maxbit = length(de2bi(int16(stegoText(j))));
    end
end
% To find the maximum and minimum bits of the characters being entered as
% Stego Text
binarray = zeros(sz,maxbit);
binarray (binarray==0)=4;
% Initialise a number other than 0 and 1 in array, to identify whether it
% is a bit. Here we took it as 4.
for i=1:sz;
    bintemp = de2bi(int16(stegoText(i)));
    j=1;
    k = 1;
    while j<=length(bintemp)
        binarray(i,j) = bintemp(k);
        j=j+1;
        k=k+1;
    end
end
binarystring = binarray(:);
binarystring (binarystring==4)=0;
end