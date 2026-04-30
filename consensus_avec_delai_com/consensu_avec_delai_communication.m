% function dx = consensu_avec_delai_communication(t,x,Z)
%     dx = zeros(4,1);
%     dx(1) = (Z(2)-x(1)) + (Z(3)-x(1)) + (Z(4)-x(1));
%     dx(2) = (Z(1)-x(2)) + (Z(3)-x(2)) + (Z(4)-x(2));
%     dx(3) = (Z(1)-x(3)) + (Z(2)-x(3)) + (Z(4)-x(3));
%     dx(4) = (Z(1)-x(4)) + (Z(2)-x(4)) + (Z(3)-x(4));
% end


% cas avec representaion matriciel


function dx = consensu_avec_delai_communication(t,x,Z)
    global A_global  D_global;

    dx = zeros(4,1); % initialisation de mes vecteurs

    dx = A_global* Z - D_global*x;
end


%% cas ou le retard est attribuer au drone en pos i et son voisin

% function dx = consensu_avec_delai_communication(t,x,Z)
%     global L_global;
% 
%     dx = zeros(4,1); % initialisation de mes vecteurs
% 
%     dx = -L_global *Z ;
% end