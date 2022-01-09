function [ finalArray ] = xtraction( gLstr,gCstr,gRstr)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
rangeMat = [0 31 round(log2(31-0)-2);
    32 255 round(log2(255-32)-3)];

binary1 = reverspdmo( gLstr,gCstr,rangeMat );
binary2 = reversapvd( gLstr,gCstr,gRstr );
finalArray = arrayMerge(binary1,binary2);

end

