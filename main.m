clc;
clear all;
tic
PRootURL = 'C:\Users\danie\OneDrive\Documents\DIP Projects Others\Monika Sharma DIP Project\algo';
ImageURL = strcat(PRootURL,'\images\','DIP3E_Original_Images_CH06\Fig0631(a)(strawberries_coffee_full_color).tif');
img = imread(ImageURL);
sizeval = [567, 680];
stegoText = 'This is a test image';
sz = length(stegoText);

% arrayChar = zeros(sz);
% print(stegoText(1));

maxbit = 0; minbit = 256;
for j=1:sz
    if length(de2bi(int16(stegoText(j))))>maxbit
        maxbit = length(de2bi(int16(stegoText(j))));
    end
    if length(de2bi(int16(stegoText(j))))<maxbit
        minbit = length(de2bi(int16(stegoText(j))));
    end
end
% To find the maximum and minimum bits of the characters being entered as
% Stego Text
binarray = zeros(sz,maxbit);
for i=1:maxbit;
    for j=1:sz;
        binarray(j,i) = 4;
    end
end
% Initialise a number other than 0 and 1 in array
for i=1:sz;
    bintemp = de2bi(int16(stegoText(i)));
    j=1; count = 0;
    sizeofbinaryarray = length(bintemp);
    k = 1;
    while j<=length(bintemp)
        binarray(i,j) = bintemp(k);
        j=j+1;
        k=k+1;
    end
end
% Actual conversion from decimal ASCII values to binary
img2reduced = imresize(img, sizeval);
% imshow(img2reduced);
% imshow(binarray);
toc