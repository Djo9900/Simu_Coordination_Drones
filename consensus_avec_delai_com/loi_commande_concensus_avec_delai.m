%%%%%%%%%%%%%%%%%%Projet : Simulation de la coordination de plusieurs
%%%%%%%%%%%%%%%%%%         drones avec délai de communication       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Ce code permet de simuler la loi de consensus avec delai de communication
% pour un exemple de 4 drones.
%Le système est modélisé à l'aide d'un graphe complet à topologie fixe
% Le modele est ici écrit sous forme du système d'équations, et sous forme
% matriciel aussi. Pour simuler commenter l'un des 2 car c'est les meme
% modeles mais avec des répresentation différent.
% Le solveur utilise est dde23.
% La fonction de dynamique est définie dans un fichier(consensus_avec_delai_communication)  séparé 
% afin de faciliter la lecture et l'organisation du programme.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
%%%%%% Cas au on simule la cordination de plusieur drone en appliquant le
%%%%%% consensus avec un delai de communication choisi

tau = 0.5; % le retard
posi_inti = [4;2;6;1];  % position intial de chaque drone

sol = dde23(@consensu_avec_delai_communication, tau, posi_inti, t_simu);

t = sol.x;
x = sol.y;

figure
plot(t,x,"-", "LineWidth",2)
xlabel("temps (s)");
ylabel("Pose des drones");
title("Consensus avec dela de communication tau=2.5s");
legend("Drone_1", "Drone_2", "Drone_3","Drone_4")
grid on


%%
% Cas ou on fais un zoom sur un seul drone pouvoir son evolution 
% pour different valeur de tau

% Parametre
% tau_values = [0.2, 0.5, 1.5, 4, 5];
% 
% 
% 
% figure
% 
% hold on
% for i = 1:length(tau_values)
%     tau= tau_values(i);
%     sol = dde23(@consensu_avec_delai_communication, tau, posi_inti, t_simu);
%     t = sol.x;
%     %position du drone 1 visualiser le comportement d'un seul drone en
%     %utilisant le consensus avec delai de comunication
%     plot(sol.x, sol.y(1,:), "LineWidth", 2, ...
%         "DisplayName", sprintf("Drone 1 (tau = %.1f s)", tau));
% end
% 
% xlabel("temps (s)", 'FontSize', 12);
% ylabel("Pose du drone 1", 'FontSize', 12);
% title("Évolution du Drone 1 pour différents retards de communication",'FontSize', 14);
% legend("Location", "best", 'FontSize', 11);
% grid on
% hold off
