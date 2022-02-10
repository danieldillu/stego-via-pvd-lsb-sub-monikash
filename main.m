clc;
tic
initb4xecn;
disp('Stego Embedding Process:');
disp('_______________________________________________________________________');
stegoText = 'Hello!';
str2binary = charStringtoBin(stegoText);
pk = 1;
% =======================================================

for findex=3:size(ImageSetFolder,1)
    fprintf('%d. Processing: %s\n',findex-2,ImageSetFolder(findex).name);
    [hpathstr,hname,hext] = fileparts(ImageSetFolder(findex).name);
    coverImgUrl=strcat(ImageSetDirURL,'\',ImageSetFolder(findex).name);
    disp(strcat('   -Host Image: <a href="matlab:winopen(''',coverImgUrl,''')" > ',ImageSetFolder(findex).name,'</a>'));
    OutputImageFilepath = strcat('temp\OUTPUT TIFF\',hname,'.tif');
    coverImage = imread(coverImgUrl);
    
    img2reduced = imresize(coverImage, 0.50);
    modifiedImage = img2reduced;
    [rows, columns, NoOfchannels] = size(img2reduced);
    dimenGrayImg = [rows, columns];
    
%     str2binary = [1 0 1 0 1 0 0 1 1];
    startptofstr = 1;
    
    for i=1:dimenGrayImg(1)
        %     disp('--------------');
        if mod(i,2)~=0
            for j=3:5:(dimenGrayImg(2)-2)
                
                %             disp([i,j]);
                 p1 = img2reduced (i,j-2,3);
                p2 = img2reduced (i,j-1,3);
                p3 = img2reduced (i,j,3);
                p4 = img2reduced (i,j+1,2);
                p5 = img2reduced(i,j+2,2);
                %             disp([p1,p2,p3,p4,p5]);
                [ p1str,p2str,p3str, endpt ] = embeddingAlgo( p1,p2,p3,str2binary,startptofstr );
                startptofstr = endpt + 1;
                [ p4str,p5str,endpt ] = pvd( p4,p5,str2binary,startptofstr );
                startptofstr = endpt + 1;
                modifiedImage (i,j-2,3) = p1str;
                modifiedImage (i,j-1,3) = p2str;
                modifiedImage (i,j,3) = p3str;
                modifiedImage (i,j+1,2) = p4str;
                modifiedImage (i,j+2,2) = p5str;
                %             disp('________________');
            end
        else
            for j=(dimenGrayImg(2)-2):-5:3
                %             disp([i,j]);
                p1 = img2reduced (i,j+2,3);
                p2 = img2reduced (i,j+1,3);
                p3 = img2reduced (i,j,3);
                p4 = img2reduced (i,j-1,2);
                p5 = img2reduced (i,j-2,2);
                %             disp([p1,p2,p3,p4,p5]);
                [ p1str,p2str,p3str, endpt ] = embeddingAlgo( p1,p2,p3,str2binary,startptofstr );
                startptofstr = endpt + 1;
                [ p4str,p5str,endpt ] = pvd( p4,p5,str2binary,startptofstr );
                startptofstr = endpt + 1;
                modifiedImage (i,j+2,3) = p1str;
                modifiedImage (i,j+1,3) = p2str;
                modifiedImage (i,j,3) = p3str;
                modifiedImage (i,j-1,2) = p4str;
                modifiedImage (i,j-2,2) = p5str;
                %             disp('________________');
            end
        end
    end
    
    peaksnr(pk,1) = findex-2;
    [peaksnr(pk,2),~]=psnr(double(img2reduced),double(modifiedImage),255);
    [ fobp,capacity,bpp ] = measureParamters( img2reduced, modifiedImage );
    peaksnr(pk,3) = fobp;
    disp(strcat('   -Stego-Image: <a href="matlab:winopen(''',OutputImageFilepath,''')" > ',ImageSetFolder(findex).name,'</a>'));
    fprintf('   -For %s PSNR = %.4f, FOBP = %.4f \n',ImageSetFolder(findex).name,peaksnr(pk,2),peaksnr(pk,3));
    imwrite(modifiedImage,OutputImageFilepath);
    pk = pk + 1;
    
    disp('_______________________________________________________________________');
end

clear p1 p2 p3 p4 p5 p1str p2str p3str p4str p5str pk i j;

xlswrite(strcat(EXCELDIR,'\Steganography Results.xlsx'), peaksnr);
disp('  PSNR Report File of Watermarked Images: <a href="matlab:winopen(strcat(EXCELDIR,''\Steganography Results.xlsx''))">Steganography Results.xlsx</a>');


% =======================================================
toc;