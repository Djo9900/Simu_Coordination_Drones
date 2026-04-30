% consensus sans delai avec un exemple de 4 drone

% cette fonction permet de d'ecrire l'equation de consensus pour chaque
% drone  par le modele de consensus normal.

function dx = consensu_simple(t,x)

    dx = zeros(4,1); % initialisation de mes vecteurs
    
    dx(1) = (x(2) -x(1)) + (x(3) -x(1)) + (x(4) -x(1));
    dx(2) = (x(1) - x(2)) + (x(3) - x(2)) + (x(4) - x(2));
    dx(3) = (x(1) - x(3)) + (x(2) - x(3)) + (x(4) - x(3));
    dx(4) = (x(1) - x(4)) + (x(2) - x(4)) + (x(3) - x(4));
end


% cas avec representaion matriciel

% cette fonction permet de d'ecrire l'equation de consensus pour chaque
% drone sous forme de répresention matrice
% function dx = consensu_simple(t,x,L)

% global N
%     dx = zeros(N,1); % initialisation de mes vecteurs
%     dx = -L*x;
% end


% si vous voulez utiliser le modele avec la répresentation matriciel, il
% faut commenter le modèle normal de consensus, vice versa.
%
