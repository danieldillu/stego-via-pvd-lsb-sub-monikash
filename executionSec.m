sz = size(modifiedImage);
sz(3);
max(modifiedImage(:));
min(modifiedImage(:));
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