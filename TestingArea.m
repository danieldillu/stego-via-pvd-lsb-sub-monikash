% Testing area
clc;
clear all;
tic
PRootURL = 'C:\Users\danie\OneDrive\Documents\DIP Projects Others\Monika Sharma DIP Project\algo';
ImageDirURL = 'C:\Users\danie\OneDrive\Documents\DIP Projects Others\Monika Sharma DIP Project\algo\test image set\DIP3E_Original_Images_CH06\';
ImageURL = strcat(ImageDirURL,'Fig0631(a)(strawberries_coffee_full_color).tif');
img = imread(ImageURL);
stegoText = 'This is a test image';
str2binary = charStringtoBin (stegoText);
% Actual conversion from decimal ASCII values of chars of string to binary
img2reduced = im2double(imresize(img, [567, 680]));
% Larger image is resized to a 567 x 680, why? No reasons. And converted to
% double
[rows, columns, NoOfchannels] = size(img2reduced);
if(NoOfchannels == 3)
    graysImg = rgb2gray(img2reduced);
else
    graysImg = img2reduced;
end
gL = graysImg (1,1);
gC = graysImg (1,2);
gR = graysImg (1,3);
rangeMat = [0 31 round(log2(31-0)-2);
    32 255 round(log2(255-32)-3)];
ti = 1;
[img2reduced(1,1), img2reduced(1,2), img2reduced(1,3)]
% ---------------------------------------------------
% PDMO starts
[ gLstr,gCstr,gR,str1 ] = pdmo( gL,gC,gR,rangeMat,str2binary,ti );
% PDMO ends

% APVD starts.

[gLstr,gCstr,gRstr] = avgpvd( gLstr,gCstr,gR,str1 );
% APVD ends.
% ---------------------------------------------------
%____________________________________________________xtraction_____

ds = gLstr - gCstr;
if belongsin(ds,rangeMat(1,1),rangeMat(1,2))
   rmd1Str =  mod(gLstr,8);
elseif belongsin(ds,rangeMat(2,1),rangeMat(2,2))
    rmd1Str = mod(gLstr,16);
else
    disp('Some problem in extraction');
end

if belongsin(ds,rangeMat(1,1),rangeMat(1,2))
   rmd2Str =  mod(gCstr,8);
elseif belongsin(ds,rangeMat(2,1),rangeMat(2,2))
    rmd2Str = mod(gCstr,16);
else
    disp('Some problem in extraction 2');
end

%____________________________________________________
toc;
