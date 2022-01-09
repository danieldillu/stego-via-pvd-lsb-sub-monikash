function [ gLstr,gCstr,gRstr ] = embeddingAlgo( gL,gC,gR,str2binary,startptofstr )
% embeddingAlgo Summary of this function goes here
%   Arguments are : gL,gC,gR are 3 pixels needed to modify.
%   rangeMat, range matrix used in the matrix.
%   str2binary, Binary array or message string. It is not in string but in
%   int array format.
%   startptofstr, starting point of binary array; may be need if there are
%   more bits to be embedded.
rangeMat = [0 31 round(log2(31-0)-2);
    32 255 round(log2(255-32)-3)];
[ gLstr,gCstr,gR,endpt ] = pdmo( gL,gC,gR,rangeMat,str2binary,startptofstr );
% PDMO apply Pixel Differencing Modulo Operation, basically differencing
% and then modulo.
% disp([ gLstr,gCstr,gR,endpt ]);
[ gLstr,gCstr,gRstr ] = avgpvd( gLstr,gCstr,gR,str2binary,endpt+1 );
% APVD apply Average PVD, on top of it for adjustment it uses PVD.
end

