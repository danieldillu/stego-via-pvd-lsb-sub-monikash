clc;
tic
img = imread('C:\Users\danie\Downloads\Image Set\DIP3E_Original_Images_CH09\Fig0944(a)(calculator).tif');
sizeval = [567, 680];
stegoText = 'This is a test image';
sz = length(stegoText);
arrayChar = zeros(sz);
% print(stegoText(1));
for i=1:sz;
    arrayChar(i) = int16(stegoText(i));
end
img2reduced = imresize(img, sizeval);
imshow(img2reduced);
toc