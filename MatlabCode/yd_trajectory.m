function [y] = yd_trajectory(t,tsim,yV)
    if( t <= tsim/5)
        a1 = ((yV(2)-yV(1))/(tsim/5));
        y  = a1;
    elseif ( t<= (2*tsim/5))
        a1 = (yV(3)-yV(2))/(2*tsim/5);
        y  = a1;
    elseif ( t<= (3*tsim/5))
        a1 = (yV(4)-yV(3))/(3*tsim/5);
        y  = a1;
    elseif ( t <= (4*tsim/5))
        a1 = (yV(5)-yV(4))/(4*tsim/5);
        y  = a1;
    else
        a1 = (yV(6)-yV(5))/(tsim);
        y  = a1;
    end
end