function [ merged ] = arrayMerge( binaryst1,binaryst2 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
len = length(binaryst1)+length(binaryst2);
merged = zerows(len);

i=1;li = 1;
while li<=length(binaryst1)
    merged(i)=binaryst1(li);
    i = i+1;
    li = li+1;
end
li = 1;
while li<=length(binaryst2)
    merged(i)=binaryst2(li);
    i = i+1;
    li = li+1;
end

end

