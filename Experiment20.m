clc; close all; clear;

%% setting condition
addpath(genpath('ToolboxForSimulator'));
% importfolder   = 'ToolboxForSimulator/condition';
% importfilename = 'Result_Data.xlsx'; % 条件のファイル
% Data           = dataimport(importfolder,importfilename,[]);
% SS400_data     = readtable('SS400_data.xlsx');
% FC250_data     = readtable('FC250_data.xlsx');
% A7075_data     = readtable('A7075_data.xlsx');
% ADD_data       = readtable('ADD_data.xlsx');

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
% 音声ファイルの読み込み

[y, Fs] = audioread('MAH00566.wav');  % 音声データの読み込み

% 片チャネルを使用（ステレオの場合）
if size(y,2) > 1
    y = y(:,1);
end

% Welch法でPSDを計算
[pxx, f] = pwelch(y, [], [], [], Fs);

% グラフ表示
plot(f, 10*log10(pxx));  % dBスケールで表示
xlabel('Frequency [Hz]');
ylabel('Power/Frequency [dB/Hz]');
title('Power Spectral Density');
grid on;
