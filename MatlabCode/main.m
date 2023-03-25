%% Progetto Robotica Mobile - Nicola Corea Matricola : 235279 - Modulo 1
% Stima Posizione Cartesiana Robot -> Beacons Trilaterazione
% Tecnica Controllo Usata          -> Feedback Linearization
% Pianificazione Percorso          -> Grafo di Visibilità
clear all
close all
clc

% Importa Parametri Differential Driver e Beacons
parameters;

%--------------------------------------------------------------------------
% Definizione Parametri Simulazione
Ts   = 0.03;                                       % tempo di campionamento 
tf   = 5;                                          % tempo di simulazione
tsim = [0:Ts:tf];                                  % intervallo di simulazione
%--------------------------------------------------------------------------
% Definizione Configurazione Iniziale e Configurazione Finale
q0 = [ 30; -15; pi/2];
qf = [22.5; 30;   0 ];

% Definizione Vertici Grafo Percorso Individuato
xV = [q0(1);-17.5;-2.5;-17.5;-2.5;qf(1)];
yV = [q0(2);-2.5;7.5;22.5;22.5;qf(2)];

%--------------------------------------------------------------------------
% Pianificazione Traiettoria e Controllo

% Definizione Polinomi Interpolanti e Rispettive Derivate
x=  @(t) (x_trajectory(t,tf,xV));
y=  @(t) (y_trajectory(t,tf,yV));
xp= @(t) (xd_trajectory(t,tf,xV));
yp= @(t) (yd_trajectory(t,tf,yV));

% Simulazione Su Uniciclo A Trazione Differenziale
myRobot = @(t,X) (robot(t,X,x,y,xp,yp,4,5,0.2,Beacons,N));

% Integrazione Numerica 
[t,X]   = ode23(myRobot,[0:Ts:tf],q0);

% Inizializzazione Finestra Di Rappresentazione
plotDifferentialDrive(q0(1),q0(2),q0(3),qf(1),qf(2));

% Interrompi Simulazione Codice
fprintf("-> Premere Invio Per Simulazione");
pause;

% Simulazione Su Uniciclo
for k   = 1 : length(t)
    plotDifferentialDrive(X(k,1),X(k,2),X(k,3),qf(1),qf(2));
    pause(0.1);
end

% Correzione Orientazione Robot
correggiOrientazioneRobot(X(end,3),qf(3),X(end,1),X(end,2),qf);

% Funzioni a Supporto
function X = robot(t,X,x,y,xd,yd,k1,k2,b,Beacons,N)

% Uso Posizione "reale" robot per simulare segnali dai beacons
x_real         = X(1);
y_real         = X(2);

% Definisco una stima della posizione effettiva del robot
pRumorosa = [x_real;y_real] + normrnd(0,0.001,2,1);

% Determinazione Distanza Da Ciascun Beacons
distanze  = getDistanze(Beacons,N,pRumorosa(1),pRumorosa(2));
distanze1 = getDistanze(Beacons,N,x_real,y_real);

% Misure Rumorose Dai Beacons
distanzeRumorose = distanze1 + normrnd(1,0.09,4,1);

% Determinazione Jacobiano Campo Vettoriale F
Jacobiano = getJacobiano(Beacons,N,pRumorosa(1),pRumorosa(2));

% Stimo Posizione
pStimata    = pRumorosa + pinv(Jacobiano)*(distanzeRumorose - distanze);
Bstima      = [pStimata(1,1) pStimata(2,1)]; 

% Integrazione Numerica -> Theta è una Stima Odometrica alla Fine
theta = X(3);
y1    = Bstima(1)+b*cos(theta);
y2    = Bstima(2)+b*sin(theta);

% Traiettoria Desiderata
xS=x(t);
yS=y(t);

% Derivate Traiettoria
xdS=xd(t);
ydS=yd(t);

% Matrice Trasformazione Ingressi
T =[ cos(theta)   , sin(theta);
    -sin(theta)/b ,cos(theta)/b];

% Ingressi Modello Linearizzato
u1=xdS+k1*(xS-y1);
u2=ydS+k2*(yS-y2);

% Definizione Ingressi Differential Drive -> Antitrasformazione
ingressi = T*[u1;u2];
v=ingressi(1);
w=ingressi(2);

% Uniciclo Modello Cinematico
X=[v*cos(theta);v*sin(theta);w];

end