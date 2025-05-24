function plot_Task1(boiling_data)
figure; loglog(boiling_data.delta_Tsat0, boiling_data.q0, '-o', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'b','MarkerFaceColor', 'b')
xlabel('wall superheat $\Delta T_{\mathrm{sat}}$ [K]', 'Interpreter', 'latex');
ylabel('heat flux $q_{\mathrm{w}}$ [MW/m$^2$]', 'Interpreter', 'latex'); 
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
figure; loglog(boiling_data.delta_Tsat30, boiling_data.q30, '-o', 'LineWidth', 5, 'MarkerSize', 8, 'Color', 'b','MarkerFaceColor', 'b')
xlabel('wall superheat $\Delta T_{\mathrm{sat}}$ [K]', 'Interpreter', 'latex');
ylabel('heat flux $q_{\mathrm{w}}$ [MW/m$^2$]', 'Interpreter', 'latex'); 
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
end