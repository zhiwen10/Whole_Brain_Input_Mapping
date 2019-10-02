function [all_contra1, all_ipsi1] = norm_area_data(data)
[a,b] = size(data);
%n = the number of total samples in each category
n = (b-4)/2;
contra = data{:,4:3+n};
ipsi = data{:,5+n:end};
% get total cell counts for each sample
sum1 = contra+ipsi;
sum2 = sum(sum1);
sum3 = repmat(sum2,[a,1]);
%normalise by total cell counts in each sample
contra1 = contra./sum3;
ipsi1 = ipsi./sum3;
% contra1 = contra;
% ipsi1 = ipsi;

mean_contra=mean(contra1,2);
std_contra=std(contra1,0,2);
ms_contra = [mean_contra,std_contra];
mean_ipsi=mean(ipsi1,2);
std_ipsi=std(ipsi1,0,2);
ms_ipsi = [mean_ipsi,std_ipsi];
%normalised data points + mean +stdev
all_contra = [contra1 ms_contra];
all_ipsi = [ipsi1 ms_ipsi];
all_contra1 = [data(:,1:3),array2table(all_contra)];
all_contra1.Properties.VariableNames = [data.Properties.VariableNames(1:b-n-1),{'mean'},{'stdev'}];
all_ipsi1 = [data(:,1:3),array2table(all_ipsi)];
all_ipsi1.Properties.VariableNames = [data.Properties.VariableNames(1:b-n-1),{'mean'},{'stdev'}];
end
