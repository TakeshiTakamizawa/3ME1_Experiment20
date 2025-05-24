clc; close all; clear;

%% setting condition
addpath(genpath('ToolboxForSimulator'));
% importfolder   = 'ToolboxForSimulator/condition';
% importfilename = 'Result_Data.xlsx'; % 条件のファイル
% Data           = dataimport(importfolder,importfilename,[]);
boiling_data     = readtable('boiling_data.xlsx');


%% 原理
% T_data = [0, 100, 300];
% rho_data = [9.81e-8, 13.6e-8, 21.0e-8];
% 
% p = polyfit(T_data, rho_data, 2); 
% 
% fprintf('近似式: rho(T) = %.3e*T^2 + %.3e*T + %.3e\n', p(1), p(2), p(3));
% 
% T_input = input('体積抵抗率を求めたい温度T（℃）を入力してください: ');
% 
% rho_T = polyval(p, T_input);
% slope_T = 2 * p(1) * T_input + p(2);
% fprintf('T = %.1f ℃ における体積抵抗率: %.3e Ωm\n', T_input, rho_T);
% fprintf('T = %.1f ℃ における傾き（温度係数）: %.3e Ωm/℃\n', T_input, slope_T);
% 
% T_fit = linspace(min(T_data), max(T_data), 100);
% rho_fit = polyval(p, T_fit);
% plot(T_data, rho_data, 'ro', T_fit, rho_fit, 'b-');
% hold on;
% plot(T_input, rho_T, 'ks', 'MarkerFaceColor', 'k');
% xlabel('温度 (℃)');
% ylabel('体積抵抗率 (Ωm)');
% title('白金の体積抵抗率の温度依存性');
% legend('データ点', '近似曲線', '指定温度での値');
% grid on;

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

% 標準課題3


% 標準課題4
FileName1 = 'MAH00565.wav'; TitleName1 = '沸騰音';
FileName2 = 'MAH00566.wav'; TitleName2 = '環境音';
plot_Task4(FileName1, TitleName1, FileName2, TitleName2)
