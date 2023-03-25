function correggiOrientazioneRobot(thetaF,thetaD,x,y,qf)
if ((thetaF - thetaD) > 0)
    for k = thetaF:-0.1:thetaD
        plotDifferentialDrive(x,y,k,qf(1),qf(2));
        pause(0.1);
    end
else
    for k = thetaF:0.1:thetaD
        plotDifferentialDrive(x,y,k,qf(1),qf(2));
        pause(0.1);
    end 
end
end