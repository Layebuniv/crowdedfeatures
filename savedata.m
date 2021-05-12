% Xdata=xlsread('data_bc');
% Xtarget = xlsread('target_bc');
%  
% save('breast_cancer','Xdata','Xtarget')
Xdata=xlsread('data_ovr');
Xtarget = xlsread('target_ovr');
save('ovarian','Xdata','Xtarget')