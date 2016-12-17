function [Year,Month,Date,Hour,Minute,Second,Bat_Lvl,MLX_IR_C,MLX_Amb_C,Upper_Soil_Temp,Upper_Soil_Mois,Lower_Soil_Temp,Lower_Soil_Mois,Pressure,BMP_Amb,Wind_Dir,Wind_Spd,Sunlight,SHT_Amb_C,SHT_Hum_Pct] = importfile(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [YEAR,MONTH,DATE,HOUR,MINUTE,SECOND,BAT_LVL,MLX_IR_C,MLX_AMB_C,UPPER_SOIL_TEMP,UPPER_SOIL_MOIS,LOWER_SOIL_TEMP,LOWER_SOIL_MOIS,PRESSURE,BMP_AMB,WIND_DIR,WIND_SPD,SUNLIGHT,SHT_AMB_C,SHT_HUM_PCT]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [YEAR,MONTH,DATE,HOUR,MINUTE,SECOND,BAT_LVL,MLX_IR_C,MLX_AMB_C,UPPER_SOIL_TEMP,UPPER_SOIL_MOIS,LOWER_SOIL_TEMP,LOWER_SOIL_MOIS,PRESSURE,BMP_AMB,WIND_DIR,WIND_SPD,SUNLIGHT,SHT_AMB_C,SHT_HUM_PCT]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [Year,Month,Date,Hour,Minute,Second,Bat_Lvl,MLX_IR_C,MLX_Amb_C,Upper_Soil_Temp,Upper_Soil_Mois,Lower_Soil_Temp,Lower_Soil_Mois,Pressure,BMP_Amb,Wind_Dir,Wind_Spd,Sunlight,SHT_Amb_C,SHT_Hum_Pct] = importfile('LEMSA_00.CSV',2, 18282);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/12/17 01:41:50

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
Year = dataArray{:, 1};
Month = dataArray{:, 2};
Date = dataArray{:, 3};
Hour = dataArray{:, 4};
Minute = dataArray{:, 5};
Second = dataArray{:, 6};
Bat_Lvl = dataArray{:, 7};
MLX_IR_C = dataArray{:, 8};
MLX_Amb_C = dataArray{:, 9};
Upper_Soil_Temp = dataArray{:, 10};
Upper_Soil_Mois = dataArray{:, 11};
Lower_Soil_Temp = dataArray{:, 12};
Lower_Soil_Mois = dataArray{:, 13};
Pressure = dataArray{:, 14};
BMP_Amb = dataArray{:, 15};
Wind_Dir = dataArray{:, 16};
Wind_Spd = dataArray{:, 17};
Sunlight = dataArray{:, 18};
SHT_Amb_C = dataArray{:, 19};
SHT_Hum_Pct = dataArray{:, 20};


