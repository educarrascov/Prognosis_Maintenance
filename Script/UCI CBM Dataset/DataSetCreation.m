%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Edu\Dropbox\Alid-Carrasco\Tesis\Desarrollo Tesis\UCI CBM Dataset\data.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/04/04 23:19:16

%% Initialize variables.
filename = 'C:\Users\Edu\Dropbox\Alid-Carrasco\Tesis\Desarrollo Tesis\UCI CBM Dataset\data.txt';

%% Format for each line of text:
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
% For more information, see the TEXTSCAN documentation.
formatSpec = '%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
data = table(dataArray{1:end-1}, 'VariableNames', {'LeverPosition_lp_','ShipSpeed_v__knots_','GasTurbineShaftTorque_GTT__kNM_','GasTurbineRateOfRevolutions_GTn__rpm_','GasGeneratorRateOfRevolutions_GGn__rpm_','StarboardPropellerTorque_Ts__kN_','PortPropellerTorque_Tp__kN_','HPTurbineExitTemperature_T48__C_','GTCompressorInletAirTemperature_T1__C_','GTCompressorOutletAirTemperature_T2__C_','HPTurbineExitPressure_P48__bar_','GTCompressorInletAirPressure_P1__bar_','GTCompressorOutletAirPressure_P2__bar_','GasTurbineExhaustGasPressure_Pexh__bar_','TurbineInjectonControl_TIC____','FuelFlow_mf__kg_s_','GTCompressorDecayStateCoefficient_','GTTurbineDecayStateCoefficient_'});

%% Clear temporary variables
clearvars filename formatSpec fileID dataArray ans;