clc;
clear all;
tic
img = imread('C:\Users\danie\Downloads\Image Set\DIP3E_Original_Images_CH09\Fig0944(a)(calculator).tif');
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
binarray = zeros(sz,maxbit);
for i=1:maxbit;
    for j=1:sz;
        binarray(j,i) = 4;
    end
end
for i=1:sz;
    bintemp = de2bi(int16(stegoText(i)));
    j=1; 
    sizeofbinaryarray = length(bintemp);
    if sizeofbinaryarray < maxbit
        differencebit = maxbit - sizeofbinaryarray;
        j = j + differencebit;
    end
    k = 1;
    while j<=length(bintemp)
        
%         binarray(i,j) = bintemp(:,k)
        i
        j
        k
        j=j+1;
        k=k+1;
        
        
    end
    
end
img2reduced = imresize(img, sizeval);
% imshow(img2reduced);
toc