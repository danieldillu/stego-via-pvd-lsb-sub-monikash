ImageSetDirURL = 'temp\image set\';
TRANSIMAGEDIR = '';
OUTPUTIMAGEDIR = '';
EXCELDIR = '';
if exist('temp\transImage','dir')==7
    TRANSIMAGEDIR = 'temp\transImage';
else
    mkdir('temp\transImage');
    TRANSIMAGEDIR = 'temp\transImage';
%    For any transitional images
end

if exist('temp\OUTPUT TIFF','dir')==7
    OUTPUTIMAGEDIR = 'temp\OUTPUT TIFF';
else
   mkdir( 'temp\OUTPUT TIFF');
   OUTPUTIMAGEDIR = 'temp\OUTPUT TIFF';
end
%  Images After embedding

if exist('temp\OUTPUT TIFF\EXCEL','dir')==7
	EXCELDIR = 'temp\OUTPUT TIFF\EXCEL';
else
   mkdir( 'temp\OUTPUT TIFF\EXCEL');
   EXCELDIR = 'temp\OUTPUT TIFF\EXCEL';
end
%  Excel Sheets After embedding result.

if exist('temp\OUTPUT TIFF\Histogram','dir')==7
	HISTODIR = 'temp\OUTPUT TIFF\Histogram\';
else
   mkdir( 'temp\OUTPUT TIFF\Histogram');
   HISTODIR = 'temp\OUTPUT TIFF\Histogram\';
end
% Histogram before and after stego.

ImageSetFolder = dir(ImageSetDirURL);