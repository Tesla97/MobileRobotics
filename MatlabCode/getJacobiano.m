function [Jacobiano] = getJacobiano(Beacons,N,x,y)
% Inizializzazione Jacobiano
Jacobiano = zeros(N,2);
% Definizione Righe Jacobiano
for j = 1 : N
    dist  = sqrt((Beacons(1,j)-x)^2+(Beacons(2,j)-y)^2);
    Jx    = (Beacons(1,j)-x)/dist;
    Jy    = (Beacons(2,j)-y)/dist;
    Jacobiano(j,:)= [Jx Jy];
end
end