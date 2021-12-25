clc;
tic
img = imread('C:\Users\danie\Downloads\Image Set\DIP3E_Original_Images_CH09\Fig0944(a)(calculator).tif');
sizeval = [567, 680];
stegoText = 'This is a test image';
text2char = char(stegoText);

img2reduced = imresize(img, sizeval);
imshow(img2reduced);
toc