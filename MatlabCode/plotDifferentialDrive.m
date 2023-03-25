function plotDifferentialDrive(x,y,theta,xf,yf)
% Definisco Variabili Globali Memorizzazione Traiettoria Robot
global xp  yp
% Importo Parametri Del Modello e Posizione Beacons
parameters;

% Defizione Matrice in SO(3) -> Rotazione Rispetto all'asse z
R = [cos(theta) , -sin(theta) , 0;
     sin(theta) ,  cos(theta) , 0;
         0      ,       0     , 1];
     
% Rotazione Dei Vettori Posizione Vertici Differential Drive
rotazione   = R*vertici_triangolo;

% Traslazione
traslazione = [x , x , x;
               y , y , y;
               0 , 0 , 0];
           
% Posa := Traslazione + Rotazione
posa        = traslazione + rotazione;

% Memorizzazione Traiettoria Cartesiana Differential Drive
xp = [xp x];
yp = [yp y];

% Definisco Finestra Disegno
defineWindow([-38,38],[-38,38],-35,-35,70,70);

% Aggiungi Ostacoli e C-Ostacoli Alla Mappa
addObstacle(xc,yc,Width,Height,r);

% Rappresenta Obiettivo Da Raggiungere
plot(xf,yf,'g*','LineWidth',2);
text(xf,yf,'Goal','FontSize',5);

% Rappresentazione Robot
patch([posa(1,:)],[posa(2,:)],[posa(3,:)],'r');

% Rappresentazione Traiettoria Percorsa
plot(xp,yp,'b--','LineWidth',2);

% Rappresentazione Beacons
addBeaconsToMap(Beacons,N,x,y);

end