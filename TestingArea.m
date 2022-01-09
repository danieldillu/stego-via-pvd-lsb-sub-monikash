tic
% Testing area
clc
% main;
% disp('Main Ended');
% RANGETAB = [0,7,round(log2(7-0+1));
%     8,15,round(log2(15-8+1));
%     16, 31, round(log2(31-16+1));
%     32, 63, round(log2(63-32+1));
%     64, 127, round(log2(127-64+1));
%     128, 255, round(log2(255-128+1))];

rangeMat = [0 31 round(log2(31-0)-2);
    32 255 round(log2(255-32)-3)];
gLstr = 126;
gCstr = 122;
gRstr = 127;
finalArray  = xtraction( gLstr,gCstr,gRstr);

toc;
