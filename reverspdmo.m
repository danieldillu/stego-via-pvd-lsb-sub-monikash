function [ finalbinarray ] = reverspdmo( gLstr,gCstr,rangeMat )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
ds = abs(gLstr - gCstr );
numOfBitsx2 = -1; numOfBitsx1 = -1;
if belongsin(ds,rangeMat(1,1),rangeMat(1,2))
    rMd1str = mod(gLstr,8);
    numOfBitsx1 = rangeMat(1,3);
elseif belongsin(ds,rangeMat(2,1),rangeMat(2,2))
    rMd1str = mod(gLstr,16);
    numOfBitsx1 = rangeMat(2,3);
else
    disp('reverspdmo:13 Somthing wrong');
end

if belongsin(ds,rangeMat(1,1),rangeMat(1,2))
    xrMd2str = mod(gCstr,8);
    numOfBitsx2 = 3;
elseif belongsin(ds,rangeMat(2,1),rangeMat(2,2))
    xrMd2str = mod(gCstr,16);
    numOfBitsx2 = 4;
else
    disp('reverspdmo:23 Somthing wrong');
end
[numOfBitsx1, rMd1str,numOfBitsx2,xrMd2str];

binaryst1  = int2binbit(rMd1str,numOfBitsx1);
binaryst2  = int2binbit(xrMd2str,numOfBitsx2);
finalbinarray = arrayMerge(binaryst1,binaryst2);
end

