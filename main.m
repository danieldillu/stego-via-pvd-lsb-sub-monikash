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
img2reduced = imresize(img, [567, 680]);
% Larger image is resized to a 567 x 680, why? No reasons.
[rows, columns, NoOfchannels] = size(img2reduced);
% To get the dimensions of the image, NoOfchannels is used to fined if is a
% grayscale.
if(NoOfchannels == 3)
    graysImg = rgb2gray(img2reduced);
else
    graysImg = img2reduced;
end
dimenGrayImg = size(graysImg);
% If it a RGB image it is converted to Grayscale image, else it is assigned
% as Grayscale.
% ------------------------------Quantization----
% nonOverlappingBlockWithDiff
blocksize = dimenGrayImg(1)*(dimenGrayImg(2)/2);
k=1; nonOverlappingBlockWithDiff = zeros(blocksize ,5);
for i=1:dimenGrayImg(1)
    if mod(i,2)~=0
        for j=1:2:dimenGrayImg(2)
            tempi = graysImg(i,j);
            tempip1 = graysImg(i,j+1);
            nonOverlappingBlockWithDiff(k,1) = i;
            nonOverlappingBlockWithDiff(k,2) = j;
            nonOverlappingBlockWithDiff(k,3) = graysImg(i,j);
            nonOverlappingBlockWithDiff(k,4) =  graysImg(i,j+1);            
            if tempi > tempip1
                nonOverlappingBlockWithDiff(k,5) = (tempi - tempip1);
            else
                nonOverlappingBlockWithDiff(k,5) = tempip1- tempi;
            end
        %       To get a absolute of the difference becoz for negative value it is
        %       taking zero instead of any number.
            k=k+1;
        end
    else
        for j=dimenGrayImg(2):-2:1
            tempi = graysImg(i,j);
            tempip1 = graysImg(i,j-1);
            nonOverlappingBlockWithDiff(k,1) = i;
            nonOverlappingBlockWithDiff(k,2) = j;
            nonOverlappingBlockWithDiff(k,3) = graysImg(i,j);
            nonOverlappingBlockWithDiff(k,4) =  graysImg(i,j-1);
            if tempi > tempip1
                nonOverlappingBlockWithDiff(k,5) = (tempi - tempip1);
            else
                nonOverlappingBlockWithDiff(k,5) = tempip1- tempi;
            end
        %       To get a absolute of the difference becoz for negative value it is
        %       taking zero instead of any number.
            k=k+1;
        end        
    end
end

toc