pattern="<MarkerZ>";
numberZ=startsWith(Cells,pattern);
numberZ2=double(numberZ);
noncellsum=sum(numberZ2);

%extract z coordinates
index1=find(numberZ);
z_value=Cells(index1);
expression='\d*';
z_value_real=regexp(z_value,expression,'match');
z_value_real2 = str2double(z_value_real);

z_value_real3 = z_value_real2+649;
z_value_real4 = string(z_value_real3);
n = length(z_value_real4);
for i=1:n
z_remake(i,1) = strcat('<MarkerZ>',z_value_real4(i),'</MarkerZ>');
end
Cells2 = Cells(:,1);
for j=1:n
    indnum = index1(j);
    Cells2(indnum,1) = z_remake(j,1);
end
fid = fopen('cells_scaled_650-850.xml','w');
fprintf(fid,'%s\n', Cells2{:});
fclose(fid);