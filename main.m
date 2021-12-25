clc;
tic
img = imread('C:\Users\danie\Downloads\Image Set\DIP3E_Original_Images_CH09\Fig0944(a)(calculator).tif');
sizeval = [567, 680];
stegoText = 'This is a test image';
sz = length(text2char);
arrayChar = zeros(sz);
for i=1:sz;
    arrayChar{i} = asciidecode(text2char{i});
end
img2reduced = imresize(img, sizeval);
imshow(img2reduced);
toc