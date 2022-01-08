function [ gLstr,gCstr,gR,str1 ] = pdmo( gL,gC,gR,rangeMat,str2binary,ti )
%pdmo Summary of this function goes here
%   Detailed explanation goes here
dLC = abs(gL - gC);
t = rangeMat(1,3);
t1 = t;
t2 = t;
if belongsin(dLC,rangeMat(1,1),rangeMat(1,2))
    rmd1 = mod(gL,8);
elseif belongsin(dLC,rangeMat(2,1),rangeMat(2,2))
    rmd1 = mod(gL,16);
end

if belongsin(dLC,rangeMat(1,1),rangeMat(1,2))
    rmd2 = mod(gC,8);
elseif belongsin(dLC,rangeMat(2,1),rangeMat(2,2))
    rmd2 = mod(gC,16);
end
str1 = pickAMsgportion(str2binary,ti,t1);
ti = ti + t1 - 1;
str2 = pickAMsgportion(str2binary,ti,t2);
d1 = binaryArray2Int( str1 );
d2 = binaryArray2Int( str2 );
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
    disp('Something wrong on line in gCdash block of function');
end

% for gCstr , gLstr
dLCdash = abs(gLdash - gCdash);

if belongsin(dLC,rangeMat(1,1),rangeMat(1,2))
    %     Take eqn 26
    if belongsin(dLCdash,rangeMat(1,1),rangeMat(1,2))
        gLstr = gLdash;
        gCstr = gCdash;
    elseif belongsin(dLCdash,rangeMat(2,1),rangeMat(2,2)) && gLdash >= gCdash
        gLstr = gLdash - power(2,t);
        gCstr = gCdash + power(2,t);
    elseif belongsin(dLCdash,rangeMat(2,1),rangeMat(2,2)) && gLdash < gCdash
        gLstr = gLdash + power(2,t);
        gCstr = gCdash - power(2,t);
    else
        disp('Something wrong on line in gCstr , gLstr block of function');
    end
elseif belongsin(dLC,rangeMat(2,1),rangeMat(2,2))
    if belongsin(dLCdash,rangeMat(2,1),rangeMat(2,2))
        gLstr = gLdash;
        gCstr = gCdash;
    elseif belongsin(dLCdash,rangeMat(1,1),rangeMat(1,2)) && gLdash >= gCdash
        gLstr = gLdash + power(2,t);
        gCstr = gCdash - power(2,t);
    elseif belongsin(dLCdash,rangeMat(1,1),rangeMat(1,2)) && gLdash < gCdash
        gLstr = gLdash - power(2,t);
        gCstr = gCdash + power(2,t);
    else
        disp('Something wrong on line in gCstr , gLstr block of function');
    end
else
    disp('Something wrong on line in gCdash block of function');
end

if gLstr < 0 && gCstr < 0
    gLstr = gLstr + power(2,t);
    gCstr = gCstr + power(2,t);
elseif gLstr > 255 || gCstr > 255
    gLstr = gLstr - power(2,t);
    gCstr = gCstr - power(2,t);
else
    %     no need this;
end


end

