function [x,y,r] = planetary_motion_calc(xIn,yIn,vxIn,vyIn,betaIn,stepsIn,dtIn)

    x(1) = xIn;
    y(1) = yIn;
    vx(1) = vxIn;
    vy(1) = vyIn;
    beta = betaIn;
    steps = stepsIn;
    dt = dtIn;
    
    for i = 1:steps
        r = sqrt(x(i).^2 + y(i).^2);    % constant for circular orbit (not so for elliptical)
        vx(i+1) = vx(i) - ((4*pi.^2*x(i)*dt)./(r.^(beta+1)));
        vy(i+1) = vy(i) - ((4*pi.^2*y(i)*dt)./(r.^(beta+1)));
        x(i+1) = x(i) + vx(i+1)*dt;
        y(i+1) = y(i) + vy(i+1)*dt;
       
    end
end