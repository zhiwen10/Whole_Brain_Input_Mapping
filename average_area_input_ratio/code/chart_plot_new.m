[m,n] = size(PM_ipsi);
%sort all tables by mean of ERAE_PM_ipsi table 
[PM_ipsi,ind] = sortrows(PM_ipsi,n-1,{'descend'});
PM_contra = PM_contra(ind,:);
V1_ipsi = V1_ipsi(ind,:);
V1_contra = V1_contra(ind,:);

tlx_ipsi = tlx_ipsi(ind,:);
tlx_contra = tlx_contra(ind,:);
retro_ipsi = retro_ipsi(ind,:);
retro_contra = retro_contra(ind,:);

% unify all tables with same list
% if any of the ipsilateral areas is above 0.005 in ratio, they are kept in
% the table, otherwise filtered out as noise or ambiguous
id1 = find(PM_ipsi{:,end-1}>= 0.005);
id2 = find(V1_ipsi{:,end-1}>= 0.005);
id3 = find(tlx_ipsi{:,end-1}>= 0.005);
id4 = find(retro_ipsi{:,end-1}>= 0.005);
id = unique([id1;id2;id3;id4]);
% id = unique([id1;id2]);

% same list for all categories
PM_ipsi = PM_ipsi(id,:);
PM_contra = PM_contra(id,:);
V1_ipsi = V1_ipsi(id,:);
V1_contra = V1_contra(id,:);

tlx_ipsi = tlx_ipsi(id,:);
tlx_contra = tlx_contra(id,:);
retro_ipsi = retro_ipsi(id,:);
retro_contra = retro_contra(id,:);

% significant test of PMvsV1 or RETROvsTLX
num = length(id);
for i=1:num
    [pmi_t1(i,1),pmi_p1(i,1)] = ttest2(PM_ipsi{i,4:7},V1_ipsi{i,4:6});
end
for i=1:num
    [pmc_t1(i,1),pmc_p1(i,1)] = ttest2(PM_contra{i,4:7},V1_contra{i,4:6});
end
for i=1:num
    [retroi_t1(i,1),retroi_p1(i,1)] = ttest2(retro_ipsi{i,4:6},tlx_ipsi{i,4:6});
end
for i=1:num
    [retroc_t1(i,1),retroc_p1(i,1)] = ttest2(retro_contra{i,4:6},tlx_contra{i,4:6});
end

%pull together all stdev + ttest in one table
all_stdev = [retro_ipsi{:,end},tlx_ipsi{:,end},PM_ipsi{:,end},V1_ipsi{:,end},retro_contra{:,end},tlx_contra{:,end},PM_contra{:,end},V1_contra{:,end}];
all_stdev1 = [retro_ipsi(:,3),array2table(all_stdev)];
all_stdev1.Properties.VariableNames = [retro_ipsi.Properties.VariableNames(1),{'retro'},{'tlx'},{'PM'},{'V1'},{'retro1'},{'tlx1'},{'PM1'},{'V11'}];
%pull together all mean + ttest in one table
all_mean = [retro_ipsi{:,end-1},tlx_ipsi{:,end-1},PM_ipsi{:,end-1},V1_ipsi{:,end-1},retro_contra{:,end-1},tlx_contra{:,end-1},PM_contra{:,end-1},V1_contra{:,end-1},retroi_t1,retroi_p1,retroc_t1,retroc_p1,pmi_t1,pmi_p1,pmc_t1,pmc_p1];
all_mean1 = [retro_ipsi(:,3),array2table(all_mean)];
all_mean1.Properties.VariableNames = [retro_ipsi.Properties.VariableNames(1),{'retro'},{'tlx'},{'PM'},{'V1'},{'retro1'},{'tlx1'},{'PM1'},{'V11'},{'retrovstlxi'},{'retrovstlxi1'},{'retrovstlxc'},{'retrovstlxc1'},{'PMvsV1i'},{'PMvsV1i1'},{'PMvsV1c'},{'PMvsV1c1'}];
%pull togther comparison for bar plot later
ERAE = [PM_ipsi{:,end-1:end},PM_contra{:,end-1:end},V1_ipsi{:,end-1:end},V1_contra{:,end-1:end},all_mean1{:,14:17}];
ERAE1 = [PM_ipsi(:,1:3),array2table(ERAE)];
ERAE1.Properties.VariableNames = [PM_ipsi.Properties.VariableNames(1:3),{'pm_mean'},{'pm_stdev'},{'pm_mean1'},{'pm_stdev1'},{'v1_mean'},{'v1_stdev'},{'v1_mean1'},{'v1_stdev1'},{'PMvsV1i'},{'PMvsV1i1'},{'PMvsV1c'},{'PMvsV1c1'}];
PM = [tlx_ipsi{:,end-1:end},tlx_contra{:,end-1:end},retro_ipsi{:,end-1:end},retro_contra{:,end-1:end},all_mean1{:,10:13}];
PM1 = [PM_ipsi(:,1:3),array2table(PM)];
PM1.Properties.VariableNames = [PM_ipsi.Properties.VariableNames(1:3),{'tlx_mean'},{'tlx_stdev'},{'tlx_mean1'},{'tlx_stdev1'},{'retro_mean'},{'retro_stdev'},{'retro_mean1'},{'retro_stdev1'},{'retrovstlxi'},{'retrovstlxi1'},{'retrovstlxc'},{'retrovstlxc1'}];
%save table for all individual normalised sample with ipsi and contra seperated 
warning('off','MATLAB:xlswrite:AddSheet');
writetable(PM_ipsi,'PM.xlsx','Sheet',1);
writetable(PM_contra,'PM.xlsx','Sheet',2);
writetable(V1_ipsi,'V1.xlsx','sheet',1);
writetable(V1_contra,'V1.xlsx','sheet',2);

writetable(tlx_ipsi,'tlx.xlsx','Sheet',1);
writetable(tlx_contra,'tlx.xlsx','Sheet',2);
writetable(retro_ipsi,'retro.xlsx','Sheet',1);
writetable(retro_contra,'retro.xlsx','Sheet',2);

% save tables for all mean or all stdev
writetable(all_mean1,'all_mean_ttest.xlsx');
writetable(all_stdev1,'all_stdev_ttest.xlsx');

%save table for bar plot
writetable(ERAE1,'PMvsV1.xlsx');
writetable(PM1,'TLXvsRETRO.xlsx');
