function plot_Task4(FileName1, TitleName1, FileName2, TitleName2)
[f1, P1] = plot_PSD(FileName1, TitleName1);
[f2, P2] = plot_PSD(FileName2, TitleName2);
valid1 = (f1 > 0) & (P1 > 0);
valid2 = (f2 > 0) & (P2 > 0);
figure;
loglog(f1(valid1), P1(valid1)); hold on;
loglog(f2(valid2), P2(valid2)); hold off;
xlabel('Frequency [Hz]'); ylabel('PSD [m²/Hz]');
legend('Boiling sound', 'Ambient sound')
function [f, P1] = plot_PSD(FileName, TitleName)
[signal, Fs] = audioread(FileName);  % 音声ファイル読み込み
if size(signal,2) == 2
    signal = mean(signal, 2);
end

L = length(signal);
Y = fft(signal);

P2 = (abs(Y).^2) / (Fs * L);
P1 = P2(1:floor(L/2)+1);
P1(2:end-1) = 2 * P1(2:end-1);

f = Fs*(0:floor(L/2))/L;

f = f(:);
P1 = P1(:);

valid = (f > 0) & (P1 > 0);

figure;
loglog(f(valid), P1(valid))
xlabel('Frequency [Hz]')
ylabel('PSD [m²/Hz]')
title(TitleName)
end
end