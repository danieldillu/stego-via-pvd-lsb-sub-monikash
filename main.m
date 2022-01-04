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
blocksize = dimenGrayImg(1)*(round(dimenGrayImg(2)/3));
k=1; nonOverlappingBlockWithDiff = zeros(blocksize ,5);
rangeMat = [0 31 round(log2(31-0)-2);
    32 255 round(log2(255-32)-3)];
% 1st 2 columns are lower and upper range, 3rd is the log calculation of
% li-ui
for i=1:dimenGrayImg(1)
    if mod(i,2)~=0
        for j=2:3:(dimenGrayImg(2)-1)
            gltpix = graysImg(i,j-1);
            gctpix = graysImg(i,j);
            grtpix = graysImg(i,j+1);
            nonOverlappingBlockWithDiff(k,1) = i;
            nonOverlappingBlockWithDiff(k,2) = j;
            nonOverlappingBlockWithDiff(k,3) = graysImg(i,j-1);
            nonOverlappingBlockWithDiff(k,4) = graysImg(i,j);
            nonOverlappingBlockWithDiff(k,5) = graysImg(i,j+1);
            if gltpix > gctpix
                nonOverlappingBlockWithDiff(k,6) = (gltpix - gctpix);
            else
                nonOverlappingBlockWithDiff(k,6) = gctpix- gltpix;
            end
            % --------------------
            
            diffLC = nonOverlappingBlockWithDiff(k,6);
            if (diffLC >= rangeMat(1,1))&&(diffLC <= rangeMat(1,2)) %% 7
                t1 = rangeMat(1,3);
                t2 = rangeMat(1,3);
                rmd1 = mod(gltpix,8);
                rmd2 = mod(gctpix,8);
%         -->>>> continue here step 4.        
            elseif (diffLC >= rangeMat(2,1))&&(diffLC <= rangeMat(2,2))  %% 35
                t1 = rangeMat(2,3);
                t2 = rangeMat(2,3);
                rmd1 = mod(gltpix,16);
                rmd2 = mod(gctpix,16);
            else
                disp('Na Chal raha...');
                k
                return;
            end
            
            % -------------------------------
            k=k+1;
        end
    else
        for j=(dimenGrayImg(2)-1):-3:2
            gltpix = graysImg(i,j+1);
            gctpix = graysImg(i,j);
            grtpix = graysImg(i,j-1);
            nonOverlappingBlockWithDiff(k,1) = i;
            nonOverlappingBlockWithDiff(k,2) = j;
            nonOverlappingBlockWithDiff(k,3) = graysImg(i,j+1);
            nonOverlappingBlockWithDiff(k,4) = graysImg(i,j);
            nonOverlappingBlockWithDiff(k,5) = graysImg(i,j-1);
            if gltpix > gctpix
                nonOverlappingBlockWithDiff(k,6) = (gltpix - gctpix);
            else
                nonOverlappingBlockWithDiff(k,6) = gctpix - gltpix;
            end
            k=k+1;
        end
    end
end

toc