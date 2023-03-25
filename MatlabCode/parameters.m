% Definizione Vertice Ostacoli 
xc    = [0;-30;-10];
yc    = [10; 0;-30];

% Raggio di Aumento Ostacoli
r     = 2.5;

% Dimensione Ostacoli
Width = [25,15,35];
Height= [15,25,15];

% Definizione Parametri Strutturali Robot
W = 1.8;                % Base triangolo
H = 1.7;                % Altezza triangolo

% Definizione Robot -> Struttura Geometrica : Triangolo
vertici_triangolo  = [-W/2 W/2 -W/2; 
                      -H/2  0  +H/2;
                        0   0    0];
                    
% Positioning Con Beacons
Beacons   =  [ 30 , 30 , -30 , -30;
               30 ,-30 ,  30 , -30;
                2 ,  2 ,   2 ,   2];
N         = 4;