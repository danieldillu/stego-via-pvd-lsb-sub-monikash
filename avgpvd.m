function [ gLstr,gCstr,gRstr ] = avgpvd( gLstr,gCstr,gR,str1 )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
gAVG = (gLstr + gCstr)/2;
% % %  PVD strts
[gAVGdASH,gRdASH] = pvd( gAVG,gR,str1 );
% % %  PVD ends
dAVG = abs(gAVG-gAVGdASH);
gAVGstr = gAVGdASH + dAVG;
gRstr = gRdASH + dAVG;
% Overflow case.
if gAVGstr > 255 ||  gRstr > 255
    dOverflow = max([gAVGstr gRstr]) - 255;
    gAVGstr = gAVGstr - dOverflow;
    gRstr = gRstr - dOverflow;
end

% Underflow
if gAVGstr < 0 ||  gRstr < 0
    dUnderflow = min([gAVGstr gRstr]) - 0;
    gAVGstr = gAVGstr - dUnderflow;
    gRstr = gRstr - dUnderflow;
end

end

