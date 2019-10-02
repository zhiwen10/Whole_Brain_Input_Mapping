
% import all data tables for ERAE_PM, ERAE_V1, ERAB_PM, retro_PM
% run normalisation function {norm_area_data} to get mean, stdev for ipsi 
%and contralateral hemisphere of each category 
data = readtable("ERAE_corrected.xlsx","sheet","PM");
[PM_contra, PM_ipsi] = norm_area_data(data);
data = readtable("ERAE_corrected.xlsx","sheet","V1");
[V1_contra, V1_ipsi] = norm_area_data(data);

data = readtable("ERABvsretro3_corrected.xlsx","sheet","ERAB");
[tlx_contra, tlx_ipsi] = norm_area_data(data);
data = readtable("ERABvsretro3_corrected.xlsx","sheet","retro");
[retro_contra, retro_ipsi] = norm_area_data(data);

% save result tables to new folder
str = pwd;
save_folder = [str, '/results'];
mkdir(save_folder);
cd(save_folder);

%organise and save tables for later analysis and plot
chart_plot_new;
%sort table by area list
sort_table;
%plot two comaprisons 
plot_comparison;

