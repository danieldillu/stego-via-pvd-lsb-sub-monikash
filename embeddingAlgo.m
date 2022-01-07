function [ gLstr,gCstr,gRstr ] = embeddingAlgo( rangeMat,gL,gC,gR )
% embeddingAlgo Summary of this function goes here
%   Detailed explanation goes here

% % NEED ATTENTION BEFORE ACTUAL EXECUTION
dLC = abs(gL - gC);
t = rangeMat(1,3);
t1 = t;
t2 = t;
if dLC > rangeMat(1,1) && dLC > rangeMat(1,2)
    rmd1 = mod(gL,8);
elseif dLC > rangeMat(2,1) && dLC > rangeMat(2,2)
    rmd1 = mod(gL,16);
end

if dLC > rangeMat(1,1) && dLC > rangeMat(1,2)
    rmd2 = mod(gC,8);
elseif dLC > rangeMat(2,1) && dLC > rangeMat(2,2)
    rmd2 = mod(gC,16);
end

d1 = dec( t1);
d2 = dec( t2);
% %  Above need corrections 
dv1 = rmd1 - d1;
dv2 = d1 - rmd1;
dv3 = rmd2 - d2;
dv4 = d2 - rmd2;

% gLdash

if rmd1 == d1
   gLdash = gL; 
elseif rmd1 < d1 && abs(dv1) < power(2,t-1)
    gLdash = gL - dv1;    
elseif rmd1 > d1 && abs(dv2) < power(2,t-1)
    gLdash = gL + dv2;
elseif rmd1 < d1 && abs(dv1) >= power(2,t-1)
    e = power(2,t)+dv1;
    gLdash = gL - e;
elseif rmd1 > d1 && abs(dv2) >= power(2,t-1)
    e = power(2,t)+dv2;
    gLdash = gL + e;
else
    disp('Something wrong on line 62 of function');
end

% for gCdash

if rmd2 == d2
    gCdash = gC;
elseif rmd2 < d2 && abs(dv3) < power(2,t-1)
    gCdash = gC - dv3;
elseif rmd2 > d2 && abs(dv4) < power(2,t-1)
    gCdash = gC + dv4;
elseif rmd2 < d2 && abs(dv3) >= power(2,t-1)
    ee = power(2,t) + dv3;
    gCdash = gC - ee;
elseif rmd2 > d2 && abs(dv4) >= power(2,t-1)
    ee = power(2,t) + dv4;
    gCdash = gC + ee;
else
    disp('Something wrong on line 62 of function');
end


end

