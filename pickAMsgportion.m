%% PICK A MESSAGE PORTION OF BINARY STRING
% It picks and copy in returning variable having a portion of binary
% String and End point till copied.
% *pickAMsgportion* picks a portion of the binary string 
%   It takes an input of 3 arguments i.e. _BinaryString full array_ , _Starting
%   of the binary string_ and _length of binary needed_. 
function [ binMsgPart,endPt ] = pickAMsgportion( fullBinaryMessage, StartingPts, lengthOfMsge )

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

