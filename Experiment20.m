clc; close all; clear;

%% setting condition
addpath(genpath('ToolboxForSimulator'));
boiling_data     = readtable('boiling_data.xlsx');

% 原理
disp('【白金の温度と体積抵抗率の関係（近似曲線）】')
T_data = [0, 100, 300]; rho_data = [9.81e-8, 13.6e-8, 21.0e-8];
p = polyfit(T_data, rho_data, 1);
fprintf('近似式: rho(T) = %.3e*T + %.3e\n', p(1), p(2));

% 標準課題1
plot_Task1(boiling_data)

% 標準課題2
plot_Task2(boiling_data)

% 標準課題3
calc_Task3(boiling_data)

% 標準課題4
FileName1 = 'MAH00565.wav'; TitleName1 = '沸騰音';
FileName2 = 'MAH00566.wav'; TitleName2 = '環境音';
plot_Task4(FileName1, TitleName1, FileName2, TitleName2)

% 発展課題1
calc_Development(boiling_data)