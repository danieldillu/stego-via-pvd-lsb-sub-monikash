gL = 127;
gC = 125;
gR = 123;
rangeMat = [0 31 round(log2(31-0)-2);
    32 255 round(log2(255-32)-3)];
str2binary = [1 1 0 0 1 0 0 1 0 0 1 1];
startptofstr = 1;
[ gLstr,gCstr,gR,endpt ] = pdmo( gL,gC,gR,rangeMat,str2binary,startptofstr );
[ gLstr,gCstr,gRstr ] = avgpvd( gLstr,gCstr,gR,str2binary,endpt+1 )
