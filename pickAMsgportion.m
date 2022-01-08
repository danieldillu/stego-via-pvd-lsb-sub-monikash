function [ binMsgPart ] = pickAMsgportion( fullBinaryMessage, StartingPts, lengthOfMsge )
%pickAMsgportion Summary of this function goes here
%   Detailed explanation goes here
endPt = StartingPts + lengthOfMsge - 1;
lengthOfBi = length(fullBinaryMessage);
k = 1;
for i = StartingPts:endPt
    if i > lengthOfBi
        binMsgPart(k) = 0;
    else
        binMsgPart(k) = fullBinaryMessage(i);
    end
    k = k + 1;
    
end

end

