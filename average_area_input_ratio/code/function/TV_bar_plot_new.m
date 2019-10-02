function h = TV_bar_plot_new(table1)
% table1 = sortrows(table1,11);
ipsi(:,1) = table1{:,4};
ipsi(:,2) = table1{:,8};
ipsi_error(:,1) = table1{:,5};
ipsi_error(:,2) = table1{:,9};

contra(:,1) = table1{:,6};
contra(:,2) = table1{:,10};
contra_error(:,1) = table1{:,7};
contra_error(:,2) = table1{:,11};

% table1 = readtable("all_mean_sort.xlsx");
% table2 = readtable("all_stdev_sort.xlsx");

% ipsi(:,1) = table1{:,5};
% ipsi(:,2) = table1{:,4};
% ipsi_error(:,1) = table2{:,5};
% ipsi_error(:,2) = table2{:,4};
% 
% contra(:,1) = table1{:,9};
% contra(:,2) = table1{:,8};
% contra_error(:,1) = table2{:,9};
% contra_error(:,2) = table2{:,8};

ipsi_p = table1{:,12};
contra_p = table1{:,14};

%plot ipsilateral
a = ipsi;
b = ipsi_error;
ctrs = 1:size(a,1);
data = a;
h = figure
subplot(1,2,1)
hBar = bar(ctrs, data);
for k1 = 1:size(a,2)
    ctr(k1,:) = bsxfun(@plus, hBar(1).XData, [hBar(k1).XOffset]');
    ydt(k1,:) = hBar(k1).YData;
end
bneg=zeros(size(b));
hold on
errorbar(ctr(1,:), ydt(1,:),bneg(:,1), b(:,1),'.','CapSize',3,'Color',[0, 0.4470, 0.7410]);
hold on
errorbar(ctr(2,:), ydt(2,:),bneg(:,2), b(:,2),'.','CapSize',3,'Color',[0.8500, 0.3250, 0.0980]);
hold on
inx = find(ipsi_p);
ctr1 = ctr(1,inx);
b1 = b';
texty = max(ydt(1:2,:)+b1);
texty = texty(find(ipsi_p));
text(ctr1+0.15,texty+0.01,'*','FontSize',12);
hold on 
x = string(table1{:,3})';
for i=1:length(x)
text(ctr(1,i),-0.005,x(1,i),'FontSize',6);
end
hold on
% errorbar(ctr(3,:), ydt(3,:), bneg(:,3), b(:,3), '.k');
hold off
ylim([0,0.5]);
% ylim([0,20000]);
set(gca,'xtick',[])


% plot contralateral
a = contra;
b = contra_error;
ctrs = 1:size(a,1);
data = a;

subplot(1,2,2)
hBar2 = bar(ctrs, data);
for k1 = 1:size(a,2)
    ctr(k1,:) = bsxfun(@plus, hBar2(1).XData, [hBar2(k1).XOffset]');
    ydt(k1,:) = hBar2(k1).YData;
end
bneg=zeros(size(b));
hold on
errorbar(ctr(1,:), ydt(1,:),bneg(:,1), b(:,1),'.','CapSize',3,'Color',[0, 0.4470, 0.7410]);
hold on
errorbar(ctr(2,:), ydt(2,:),bneg(:,2), b(:,2),'.','CapSize',3,'Color',[0.8500, 0.3250, 0.0980]);
hold on
inx = find(contra_p);
ctr1 = ctr(1,inx);
b1 = b';
texty = max(ydt+b1);
texty = texty(find(contra_p));
text(ctr1+0.15,texty+0.002,'*','FontSize',12);
hold on 
for i=1:length(x)
text(ctr(1,i),-0.001,x(1,i),'FontSize',6);
end
% hold on
% errorbar(ctr(3,:), ydt(3,:), bneg(:,3), b(:,3), '.k');
hold off
ylim([0,0.2]);
% ylim([0,10000]);
set(gca,'xtick',[])
end
% print('-dsvg','-painters','-loose','summary_plot_temp.svg')