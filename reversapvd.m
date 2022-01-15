function [ binaryArray ] = reversapvd( gLstr,gCstr,gRstr )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

xgAvgstr = floor((gLstr+gCstr)/2);
binaryArray  = pvdxtract( xgAvgstr,gRstr );


end

