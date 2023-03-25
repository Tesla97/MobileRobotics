function addBeaconsToMap(Beacons,N,x,y)
% Disegna Beacons Nello Spazio
plot3(Beacons(1,:),Beacons(2,:),Beacons(3,:),'r*','LineWidth',2);
text(Beacons(1,:),Beacons(2,:),Beacons(3,:),{'B1','B2','B3','B4'},'FontSize',7);

% Rappresentazione Segnali Ricevuti Dai Beacons
for k = 1 : N
    line([Beacons(1,k) x],[Beacons(2,k) y],[Beacons(3,k) 0],'LineStyle','--');
end

end