function [ fobp,capacity,bpp ] = measureParamters( originalImage, modifiedImage )
%measureParamters Summary of this function goes here
%   Detailed explanation goes here
capacity = 0;
bpp = 0;
sz = size(modifiedImage);
fobp = 0;
for i = 1:sz(3)
    for j = 1:sz(1)
        for k = 1: sz(1)
            if modifiedImage(j,k,i) > 255 || modifiedImage(j,k,i) < 0
                fobp = fobp + 1;
            end
        end
    end 
end


end

