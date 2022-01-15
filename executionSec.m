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
modifiedImage = graysImg;
% If it a RGB image it is converted to Grayscale image, else it is assigned
% as Grayscale.
% ------------------------------Quantization----
% nonOverlappingBlockWithDiff
% blocksize = dimenGrayImg(1)*(dimenGrayImg(2)/2);
k=1; 
% nonOverlappingBlockWithDiff = zeros(blocksize ,5);
startptofstr = 1;
% All the pixels : full images
for i=1:dimenGrayImg(1)
%     disp('--------------');
    if mod(i,2)~=0
        for j=3:5:(dimenGrayImg(2)-2)
            
%             disp([i,j]);
            p1 = graysImg (i,j-2);
            p2 = graysImg (i,j-1);
            p3 = graysImg (i,j);
            p4 = graysImg (i,j+1);
            p5 = graysImg (i,j+2);
%             disp([p1,p2,p3,p4,p5]);
            [ p1str,p2str,p3str, endpt ] = embeddingAlgo( p1,p2,p3,str2binary,startptofstr );
            startptofstr = endpt + 1;
            [ p4str,p5str,endpt ] = pvd( p4,p5,str2binary,startptofstr );
            startptofstr = endpt + 1;
            modifiedImage (i,j-2) = p1str;
            modifiedImage (i,j-1) = p2str;
            modifiedImage (i,j) = p3str;
            modifiedImage (i,j+1) = p4str;
            modifiedImage (i,j+2) = p5str;
%             disp('________________');
        end
    else
        for j=(dimenGrayImg(2)-2):-5:3
%             disp([i,j]);
            p1 = graysImg (i,j+2);
            p2 = graysImg (i,j+1);
            p3 = graysImg (i,j);
            p4 = graysImg (i,j-1);
            p5 = graysImg (i,j-2);
%             disp([p1,p2,p3,p4,p5]);
            [ p1str,p2str,p3str, endpt ] = embeddingAlgo( p1,p2,p3,str2binary,startptofstr );
            startptofstr = endpt + 1;
            [ p4str,p5str,endpt ] = pvd( p4,p5,str2binary,startptofstr );
            startptofstr = endpt + 1;
            modifiedImage (i,j+2) = p1str;
            modifiedImage (i,j+1) = p2str;
            modifiedImage (i,j) = p3str;
            modifiedImage (i,j-1) = p4str;
            modifiedImage (i,j-2) = p5str;
%             disp('________________');
        end        
    end
end

toc