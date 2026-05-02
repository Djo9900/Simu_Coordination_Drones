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
%L_global = L;

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



