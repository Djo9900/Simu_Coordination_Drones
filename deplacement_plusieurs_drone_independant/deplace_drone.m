%% %%%%%%%%%%%%%%%%Projet d'iitiation à la recherche%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ce code permet de simuler le déplacement de plusieurs drones, ayant des positions initiales différentes, 
% vers une cible fixe dont la position est générée de manière aléatoire.

% le modele utilisé ici est le  simple integrateur : dx/dt = u_i ( vitèsse imposé)
%le solveur utilie est ode45
% la commande de vitesse est tel que u_i = x_cible -x

%La fonction de dynamique est définie dans un fichier (fct_model_dynamique.m) 
% séparé afin de faciliter la lecture et l'organisation du programme.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all; close all; clc;

%%% Parmettre %%%%

N = 3; % nombre de drone

temps_simu = [0 10];

x_cible =rand(2,1)*20 ; % on génère la position cible de maniere aleatoire en 2D


initialPosition = [1 2 3;1 2 3]; % Positions initiales des drones



%%% simulation du model

figure('Name', 'Déplacement des drones', 'NumberTitle', 'off');
colors = ['b', 'g', 'm'];

% Simuler le mouvement de plusieurs drones
for i = 1:N
    x_init = initialPosition(: , i); % Positions initiales des drones

    %modele dynanmique du trône en resolvons l'equadif
    [t, x] = ode45(@(t,x) fct_model_dynamique(t, x, x_cible), temps_simu, x_init);
    
    %traçons la trjectoir des drones
    subplot(2,1,1);
    plot(x(:,1), x(:,2), '-', 'LineWidth', 2); hold on;


    % tacer la position  X et Y de chaque drone par rapport au temps
    % subplot(2,1,2);
    % plot(t, x(:,1), '-', t, x(:,2), '--', 'LineWidth', 1.5); 
    % hold on;
end

% le point cible 
subplot(2,1,1);
plot(x_cible(1), x_cible(2), 'r*', 'MarkerSize', 10, 'LineWidth', 2); % La cible
xlabel('Position X'); ylabel('Position Y');
title('Trajectoires de 3 drones indépendants vers une même cible');
legend("drone_1","drone_2","drone_3","cible")
grid on;

% subplot(2,1,2)
% xlabel("temps(s)"); 
% ylabel("Position");
% title("Position(X et Y) des drones par raport au temps")
% %legend("X_1","Y_1","X_2","Y_2","X_3","Y_3")
% grid on