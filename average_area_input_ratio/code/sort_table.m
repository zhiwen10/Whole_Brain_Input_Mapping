ERAE1 = readtable("PMvsV1.xlsx");
list = readtable("list.xlsx");
[a,b] = ismember(list{:,3},ERAE1{:,3});
ERAE2 = ERAE1(b,:);
writetable(ERAE2,'PMvsV1_sorted.xlsx');

PM1 = readtable("TLXvsRETRO.xlsx");
list = readtable("list.xlsx");
[c,d] = ismember(list{:,3},PM1{:,3});
PM2 = PM1(d,:);
writetable(PM2,'TLXvsRETRO_sorted.xlsx');
