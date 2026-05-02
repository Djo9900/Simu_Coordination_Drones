
clear all;
close all;
clc;

%paramettre
N=4;

global L_global;

global A_global;
global D_global;

t_simu = [0 10];  %temps de simultion

A = ones(N,N) - eye(N); % Matrice adjacent

A_global =A;



D = (N-1)*eye(N); % Matrice de dégrée
D_global =D;



L = D - A;  % Matrice de laplacien 
L_global = L;

%%
Cas ou on fais un zoom sur un seul drone pouvoir son evolution 
pour different valeur de tau

Parametre
tau_values = [0.2, 0.5, 1.5, 4, 5];



figure

hold on
for i = 1:length(tau_values)
    tau= tau_values(i);
    sol = dde23(@consensu_avec_delai_communication, tau, posi_inti, t_simu);
    t = sol.x;
    %position du drone 1 visualiser le comportement d'un seul drone en
    %utilisant le consensus avec delai de comunication
    plot(sol.x, sol.y(1,:), "LineWidth", 2, ...
        "DisplayName", sprintf("Drone 1 (tau = %.1f s)", tau));
end

xlabel("temps (s)", 'FontSize', 12);
ylabel("Pose du drone 1", 'FontSize', 12);
title("Évolution du Drone 1 pour différents retards de communication",'FontSize', 14);
legend("Location", "best", 'FontSize', 11);
grid on
hold off