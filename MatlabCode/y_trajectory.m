function [y] = y_trajectory(t,tsim,yV)
% Divido l'intervallo temporale in N sottointervalli
if ( t <= tsim/5)
        a0 = yV(1);
        a1 = (yV(2)-yV(1))/(tsim/5);
        y  = a1*t+a0;
elseif ( t <= (2*tsim/5))
        a0 = yV(2);
        a1 = (yV(3)-yV(2))/(2*tsim/5);
        y  = a1*t+a0;
elseif ( t <= (3*tsim/5))
        a0 = yV(3);
        a1 = (yV(4)-yV(3))/(3*tsim/5);
        y  = a1*t+a0;
elseif ( t <= (4*tsim/5))
        a0 = yV(4);
        a1 = (yV(5)-yV(4))/(4*tsim/5);
        y  = a1*t+a0;
else
        a0 = yV(5);
        a1 = (yV(6)-yV(5))/(tsim);
        y  = a1*t+a0;
end
end