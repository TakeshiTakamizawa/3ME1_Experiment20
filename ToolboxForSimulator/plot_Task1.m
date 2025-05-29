function plot_Task1(boiling_data)
figure; loglog(boiling_data.delta_Tsat0, boiling_data.q0, 'o', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'b','MarkerFaceColor', 'b')
hold on;
loglog(boiling_data.delta_Tsat30, boiling_data.q30, 'o', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'r','MarkerFaceColor', 'r')
xlabel('wall superheat $\Delta T_{\mathrm{sat}}$ [K]', 'Interpreter', 'latex');
ylabel('heat flux $q_{\mathrm{w}}$ [MW/m$^2$]', 'Interpreter', 'latex'); 
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
legend(sprintf('Data for degree of subcooling %.f K', 0), sprintf('Data for degree of subcooling %.f K', 30), 'Location', 'northwest', 'FontSize', 16);
end