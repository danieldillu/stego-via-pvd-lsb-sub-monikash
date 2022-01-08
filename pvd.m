function [ g1Dash,g2dash ] = pvd( g1,g2,binarySecretMessage )
%pvd Summary of this function goes here
%   Detailed explanation goes here
gt1 = double(g1); gt2 = double(g2);
RANGETAB = [0 7 3;
    8 15 3;
    16 31 4;
    32 63 5;
    64 127 6;
    128 255 7];
sze = size(RANGETAB);
% R1=[0 7] Capacity n = 3
d = abs(gt1,gt2);
rangeLcurrent = -1; rangeUcurrent = -1; capNcrnt = -12;
for i = 1:sze(1)
    if belongsin(d,RANGETAB(i,1),RANGETAB(i,2))
        rangeLcurrent = RANGETAB(i,1);
        rangeUcurrent = RANGETAB(i,2);
        capNcrnt = RANGETAB(i,3);
    end
end
msgPortion = pickAMsgportion (binarySecretMessage,1 ,capNcrnt);
decN = binaryArray2Int(msgPortion);
dNEW = decN + rangeLcurrent;
r = abs(dNEW - d);
if g1 >= g2 && dNEW > d
    g1Dash = g1 + (r/2);
    g2dash = g2 - (r/2);
elseif g1 < g2 && dNEW > d
    g1Dash = g1 - (r/2);
    g2dash = g2 + (r/2);
elseif g1 >= g2 && dNEW <= d
    g1Dash = g1 - (r/2);
    g2dash = g2 + (r/2);
elseif g1 < g2 && dNEW <= d
    g1Dash = g1 + (r/2);
    g2dash = g2 - (r/2);
else
    disp('Check PVD function, there is something wrong here');
end
end

