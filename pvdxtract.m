function [ binaryArray ] = pvdxtract( xgAvgstr,gRstr )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
RANGETAB = [0,7,round(log2(7-0+1));
    8,15,round(log2(15-8+1));
    16, 31, round(log2(31-16+1));
    32, 63, round(log2(63-32+1));
    64, 127, round(log2(127-64+1));
    128, 255, round(log2(255-128+1))];
sze = size(RANGETAB);
xds = abs(xgAvgstr-gRstr);
rangeLcurrent = 0;
for i = 1:sze(1)
    if belongsin(xds,RANGETAB(i,1),RANGETAB(i,2))
        rangeLcurrent = RANGETAB(i,1);
%         rangeUcurrent = RANGETAB(i,2);
        capNcrnt = RANGETAB(i,3);
    end
end
s=xds-rangeLcurrent;
 binaryArray = int2binbit(s,capNcrnt);

end

