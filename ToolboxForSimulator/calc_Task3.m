function calc_Task3(boiling_data)
plot_Task3(boiling_data.delta_Tsat0(2:6,1), boiling_data.q0(2:6,1), boiling_data.delta_Tsub0(1))
plot_Task3(boiling_data.delta_Tsat30(3:end,1), boiling_data.q30(3:end,1), boiling_data.delta_Tsub30(1))
function plot_Task3(x, y, T)
logx = log10(x); logy = log10(y);
p = polyfit(logx, logy, 1);
b = p(1);
a = 10^p(2);
disp('【標準課題3】')
fprintf('Data for degree of subcooling %.f K', T); disp(' ')
fprintf('傾き： %.3f ，べき乗： %.3f', a, b); disp(' ')
x_fit = linspace(min(x)-1, max(x)+3, 100);
y_fit = a * x_fit.^b;
figure
loglog(x, y, 'o', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'b','MarkerFaceColor', 'b'); hold on;
loglog(x_fit, y_fit, '--r', 'LineWidth', 2);
legend(sprintf('Data for degree of subcooling %.f K', T), 'Linear fitted curve', 'Location', 'northwest');
xlabel('wall superheat $\Delta T_{\mathrm{sat}}$ [K]', 'Interpreter', 'latex');
ylabel('heat flux $q_{\mathrm{w}}$ [MW/m$^2$]', 'Interpreter', 'latex');
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
end
end