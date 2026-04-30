%%%%%%%%%%%%%%%%%% Projet: SImulation de la cordination de plusieurs drones
%%%%%%%%%%%%%%%%%%           sans delai de communication             %%%%%%%%%%%%%%%%%%%%%%%%


% Ce code permet de simuler la loi de consensus sans delai de communication
% pour un exemple de 4 drones.
%Le système est modélisé à l'aide d'un graphe complet à topologie fixe
% Le modele est ici écrit sous forme du système d'équations?et sous forme
% matriciel aussi. Pour simuler commenter l'un des 2 car c'est les meme
% modeles mais avec des répresentation différent.
% Le solveur utilise est ode45.
%La fonction de dynamique est définie dans un fichier(consensus_simple.m)  séparé 
% afin de faciliter la lecture et l'organisation du programme.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;
close all;
clc;
global N_global;

% Prametre
dt = 0.1;
t_simu = 0:dt:10;
N = 4; % nombre de drone



A = ones(N,N) - eye(N) ;  % Matrice d'adjacent

D = (N-1)*eye(N);  % matrice de degré

L = D - A; % matrice laplacien

pose_ini = [1;5;9;16]; % position intial de drone


figure

% C'est ici que tous ce joue car le solveur, ode45 me permet d'avoir les
% solutionsn 
[t, x] = ode45(@consensu_simple, t_simu, pose_ini);

plot(t,x, '-', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Drone Positions');
title('Algorithme de consensus sans delai de communication');
legend('Drone 1', 'Drone 2', 'Drone 3', 'Drone 4');
grid on;


