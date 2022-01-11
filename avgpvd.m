function [ gLstr,gCstr,gRstr,endPt,gAVGstr] = avgpvd( gLstr,gCstr,gR,str1,startingPt )
% avgpvd Summary of this function goes here
%   Detailed explanation goes here
gAVG = (gLstr+gCstr)/2;
% % %  PVD strts
[gAVGdASH,gRdASH,endPt] = pvd( gAVG,gR,str1,startingPt );
disp([gAVGdASH,gRdASH,endPt]);
% % %  PVD ends
dAVG = abs(gAVG-gAVGdASH);
disp(dAVG);
gAVGstr = gAVGdASH + dAVG;
gRstr = gRdASH + dAVG;
% Overflow case.
disp([gAVGstr,gRstr]);
if max([gAVGstr,gRstr]) > 255
    dOverflow = max([gAVGstr gRstr]) - 255;
    gAVGstr = gAVGstr - dOverflow;
    gRstr = gRstr - dOverflow;
end
% Underflow
if min([gAVGstr,gRstr]) < 0
    dUnderflow = min([gAVGstr gRstr]) - 0;
    gAVGstr = gAVGstr - dUnderflow;
    gRstr = gRstr - dUnderflow;
end

end

