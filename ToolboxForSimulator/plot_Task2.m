function plot_Task2(boiling_data)
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
loglog(delta_Tsat0(2:6,1), h0(2:6,1),'o', 'LineWidth', 5, 'MarkerSize', 5, 'Color', 'b','MarkerFaceColor', 'b'); hold on
loglog(delta_Tsat30(3:end,1), h30(3:end,1),'o', 'LineWidth', 5, 'MarkerSize', 5, 'Color', 'r','MarkerFaceColor', 'r'); hold on;
loglog(delta_Tsat0(1,1),h0(1,1),'^', 'LineWidth', 5, 'MarkerSize', 5, 'Color', 'b','MarkerFaceColor', 'b'); hold on
loglog(delta_Tsat30(1:2,1),h30(1:2,1),'^', 'LineWidth', 5, 'MarkerSize', 5, 'Color', 'r','MarkerFaceColor', 'r'); hold off;
legend('Nuclear boiling zone $\Delta T_{\mathrm{sub}}$=0 [K]', 'Nuclear boiling zone $\Delta T_{\mathrm{sub}}$=30 [K]', 'Natural convection region $\Delta T_{\mathrm{sub}}$=0 [K]', 'Natural convection region $\Delta T_{\mathrm{sub}}$=30 [K]', 'Interpreter', 'latex', 'FontSize', 16)
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
xlabel('wall superheat $\Delta T_{\mathrm{sat}}$ [K]', 'Interpreter', 'latex');
ylabel('heat transfer coefficient $h$ [MW/m$^2$K]', 'Interpreter', 'latex');
end