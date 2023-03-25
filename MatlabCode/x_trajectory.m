function [x] = x_trajectory(t,tsim,xV)
% Divido l'intervallo temporale in N sottointervalli
if ( t <= tsim/5)
        a0 = xV(1);
        a1 = (xV(2)-xV(1))/(tsim/5);
        x  = a1*t+a0;
elseif ( t <= (2*tsim/5))
        a0 = xV(2);
        a1 = (xV(3)-xV(2))/(2*tsim/5);
        x  = a1*t+a0;
elseif ( t <= (3*tsim/5))
        a0 = xV(3);
        a1 = (xV(4)-xV(3))/(3*tsim/5);
        x  = a1*t+a0;
elseif ( t <= 4*tsim/5)
        a0 = xV(4);
        a1 = (xV(5)-xV(4))/(4*tsim/5);
        x  = a1*t+a0;
else
        a0 = xV(5);
        a1 = (xV(6)-xV(5))/(tsim);
        x  = a1*t+a0;
end
end