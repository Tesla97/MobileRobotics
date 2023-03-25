function [distanze] = getDistanze(Beacons,N,x,y)
% Inizializzazione Vettore
distanze = zeros(4,1);
% Determino Distanze Da Ogni Beacons
for j  = 1 : N
   distanze(j)  = sqrt((Beacons(1,j)-x)^2+(Beacons(2,j)-y)^2);
end
end