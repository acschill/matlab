function [x,y,r] = elliptical_orbit_calc(xIn,yIn,vxIn,vyIn,betaIn,stepsIn,dtIn)
    x(1) = xIn;
    y(1) = yIn;
    r(1) = sqrt(xIn.^2 + yIn.^2);
    vx(1) = vxIn;
    vy(1) = vyIn;
    beta = betaIn;
    steps = stepsIn;
    dt = dtIn;
    flag = 0;
    for i = 1:steps
       
        vx(i+1) = vx(i) - 4*pi^2*(x(i)/r(i)^beta)*dt;
        vy(i+1) = vy(i) - 4*pi^2*(y(i)/r(i)^beta)*dt;
        x(i+1) = x(i) + vx(i+1)*dt;
        y(i+1) = y(i) + vy(i+1)*dt;
        r(i+1) = sqrt(x(i+1).^2 + y(i+1).^2);
        
%         if (x(i+1) <= 0)
%             flag = 1;
%         end
%         
%         if flag == 1
%             break;
%         end
    end
end