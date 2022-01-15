clc;
clear all;
tic
PRootURL = 'C:\Users\danie\OneDrive\Documents\DIP Projects Others\Monika Sharma DIP Project\algo';
ImageDirURL = 'C:\Users\danie\OneDrive\Documents\DIP Projects Others\Monika Sharma DIP Project\algo\test image set\DIP3E_Original_Images_CH06\';
ImageURL = strcat(ImageDirURL,'Fig0631(a)(strawberries_coffee_full_color).tif');
img = imread(ImageURL);
% stegoText = 'A';
% str2binary = charStringtoBin (stegoText);

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
% rangeMat = [0 31 round(log2(31-0)-2);
%     32 255 round(log2(255-32)-3)];
% 1st 2 columns are lower and upper range, 3rd is the log calculation of
% li-ui
% gL = graysImg(12,10);
% gC = graysImg(12,12);
% gR = graysImg(12,14);

gL = 127;
gC = 125;
gR = 123;

str2binary = [1 1 0 0 1 0 0 1 1];
disp('Before embedding');
disp([gL,gC,gR]);
disp('Message bits');
disp(str2binary);
startptofstr = 1;

[ gLstr,gCstr,gRstr, endpt ] = embeddingAlgo( gL,gC,gR,str2binary,startptofstr );
disp('After Embedding:');
disp([ gLstr,gCstr,gRstr,endpt ]);
xtractedbinaryArray  = xtraction( gLstr,gCstr,gRstr);
disp('Extracted Bits:');
disp(xtractedbinaryArray);


toc