clc; close all; clear;

%% setting condition
addpath(genpath('ToolboxForSimulator'));
% importfolder   = 'ToolboxForSimulator/condition';
% importfilename = 'Result_Data.xlsx'; % 条件のファイル
% Data           = dataimport(importfolder,importfilename,[]);
boiling_data     = readtable('boiling_data.xlsx');

% 原理
disp('【白金の温度と体積抵抗率の関係（近似曲線）】')
T_data = [0, 100, 300];
rho_data = [9.81e-8, 13.6e-8, 21.0e-8];
p = polyfit(T_data, rho_data, 1);
fprintf('近似式: rho(T) = %.3e*T + %.3e\n', p(1), p(2));

% 標準課題1
plot_Task1(boiling_data)

% 標準課題2
q0           = boiling_data.q0;
delta_Tsub0  = boiling_data.delta_Tsub0;
delta_Tsat0  = boiling_data.delta_Tsat0;
q30          = boiling_data.q30;
delta_Tsub30 = boiling_data.delta_Tsub30;
delta_Tsat30 = boiling_data.delta_Tsat30;
for i = 1:length(q0)
    h0(i,1) = q0(i)/(delta_Tsat0(i) + delta_Tsub0(i));
end
for i = 1:length(q30)
    h30(i,1) = q30(i)/(delta_Tsat30(i) + delta_Tsub30(i));
end
figure
loglog(delta_Tsat0(2:6,1), h0(2:6,1),'o', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'b','MarkerFaceColor', 'b'); hold on
loglog(delta_Tsat30(3:end,1), h30(3:end,1),'o', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'r','MarkerFaceColor', 'r'); hold on;
loglog(delta_Tsat0(1,1),h0(1,1),'^', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'b','MarkerFaceColor', 'b'); hold on
loglog(delta_Tsat30(2,1),h30(2,1),'^', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'r','MarkerFaceColor', 'r'); hold off;
legend('$\Delta T_{\mathrm{sub}}$=0 [K]', '$\Delta T_{\mathrm{sub}}$=30 [K]', 'Interpreter', 'latex')
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');

% 標準課題3
calc_Task3(boiling_data)

% 標準課題4
FileName1 = 'MAH00565.wav'; TitleName1 = '沸騰音';
FileName2 = 'MAH00566.wav'; TitleName2 = '環境音';
plot_Task4(FileName1, TitleName1, FileName2, TitleName2)

% 発展課題1

