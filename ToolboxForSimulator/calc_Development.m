function calc_Development(boiling_data)
plot_Development(boiling_data.delta_Tsat0(2:6,1)', boiling_data.q0(2:6,1)', boiling_data.delta_Tsub0(1))
plot_Development(boiling_data.delta_Tsat30(3:end,1)', boiling_data.q30(3:end,1)', boiling_data.delta_Tsub30(1))
function plot_Development(x, y, T)
mu_uPas = 281.58;
Pr = 1.7529;
h_fg_kJkg = 2256.43;
sigma_mN = 58.912;
rho_l = 958.35;
rho_v = 0.59817;
Cp_kJkgK = 4.2157;
C_sf = 0.013;
r = 0.33;
s = 1.7;

% 単位変換
mu = mu_uPas * 1e-6;                % Pa·s
h_fg = h_fg_kJkg * 1e3;             % J/kg
sigma = sigma_mN * 1e-3;            % N/m
Cp = Cp_kJkgK * 1e3;                % J/kg·K

dT = linspace(min(x)-2, max(x)+2, 200);

term1 = (1 / C_sf)^(1/r);
term2 = Pr^(-s/r);
term3 = (Cp * dT / h_fg).^(1/r);
lhs = term1 .* term2 .* term3;
qw_Rohsenow_W = lhs .* mu .* h_fg ./ sqrt(sigma / (9.81 * (rho_l - rho_v)));
qw_Rohsenow_MW = qw_Rohsenow_W / 1e6;

figure;
loglog(x, y, 'o', 'LineWidth', 2.5, 'MarkerSize', 8, 'Color', 'b', 'MarkerFaceColor', 'b'); 
hold on;

loglog(dT, qw_Rohsenow_MW, 'r-', 'LineWidth', 2);
xlabel('wall superheat $\Delta T_{\mathrm{sat}}$ [K]', 'Interpreter', 'latex');
ylabel('heat flux $q_{\mathrm{w}}$ [MW/m$^2$]', 'Interpreter', 'latex');
legend({sprintf('Data for degree of subcooling %.f K', T), 'Rohsenow Prediction'}, 'Location', 'northwest');
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
end
end