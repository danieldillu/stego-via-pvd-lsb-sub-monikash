% Testing area
clc;
main;
disp('Main Ended');
[ gLstr,gCstr,gRstr ]
ds = gLstr - gCstr; numOfBitsx2 = -1; numOfBitsx1 = -1;
if belongsin(ds,rangeMat(1,1),rangeMat(1,2))
    rMd1str = mod(gLstr,8);
    numOfBitsx1 = 3;
elseif belongsin(ds,rangeMat(2,1),rangeMat(2,2))
    rMd1str = mod(gLstr,16);
    numOfBitsx1 = 4;
else
    disp('Somthing wrong');
end

if belongsin(ds,rangeMat(1,1),rangeMat(1,2))
    xrMd2str = mod(gCstr,8);
    numOfBitsx2 = 3;
elseif belongsin(ds,rangeMat(2,1),rangeMat(2,2))
    xrMd2str = mod(gCstr,16);
    numOfBitsx2 = 4;
else
    disp('Somthing wrong');
end
[rMd1str,xrMd2str]
[numOfBitsx1,numOfBitsx2]
binaryst1  = int2binbit(rMd1str,numOfBitsx1)
binaryst2  = int2binbit(xrMd2str,numOfBitsx2)


toc;
