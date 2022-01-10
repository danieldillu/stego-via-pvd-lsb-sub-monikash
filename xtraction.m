function [ finalArray ] = xtraction( gLstr,gCstr,gRstr)
%xtraction() is for executing the extraction binary message bits.
%   It is used to extraction the bits which was initially embedding in the image.
%   It takes an arguments list 3 Image Pixels in grayscale or single component of RGB image.

rangeMat = [0 31 round(log2(31-0)-2);
    32 255 round(log2(255-32)-3)];

binary1 = reverspdmo( gLstr,gCstr,rangeMat );
binary2 = reversapvd( gLstr,gCstr,gRstr );
finalArray = arrayMerge(binary1,binary2);

end

