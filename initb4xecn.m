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

if exist('temp\EXCEL','dir')==7
	EXCELDIR = 'temp\EXCEL';
else
   mkdir( 'temp\EXCEL');
   EXCELDIR = 'temp\EXCEL';
end
%  Excel Sheets After embedding result.


ImageSetFolder = dir(ImageSetDirURL);