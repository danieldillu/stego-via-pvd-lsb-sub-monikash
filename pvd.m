function [ g1Dash,g2dash ] = pvd( g1,g2,binarySecretMessage,startPt )
% pvd Summary of this function goes here
%   Detailed explanation goes here
gt1 = double(g1);
gt2 = double(g2);
RANGETAB = [0,7,round(log2(7-0+1));
    8,15,round(log2(15-8+1));
    16, 31, round(log2(31-16+1));
    32, 63, round(log2(63-32+1));
    64, 127, round(log2(127-64+1));
    128, 255, round(log2(255-128+1))];
sze = size(RANGETAB);
% R1=[0 7] Capacity n = 3
d = abs(gt1-gt2);
rangeLcurrent = -1; 
% rangeUcurrent = -1; 
capNcrnt = -12;
for i = 1:sze(1)
    if belongsin(d,RANGETAB(i,1),RANGETAB(i,2))
        rangeLcurrent = RANGETAB(i,1);
%         rangeUcurrent = RANGETAB(i,2);
        capNcrnt = RANGETAB(i,3);
    end
end
 
decN = binaryArray2Int(pickAMsgportion (binarySecretMessage,startPt ,capNcrnt));
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
g1Dash = round(g1Dash);
g2dash = round(g2dash);
end

