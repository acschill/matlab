% calcs v_y(t)
function [t,v] = bicycle_calc_w_resistance(dtIn,powerIn,massIn,viIn)
    % max num of runs 
    MAX = 4000;
    %g = 9.8; % m/s*s
    
    % intialize arrays
    t = zeros(1,MAX);
    v = zeros(1,MAX);
    
    % assign intial values
    dt = dtIn;
    P = powerIn;
    m = massIn;
    v(1) = viIn;
    A = 0.33;           % meters squared
    C = 1;
    rho = 1.225;        % kg/m^3
    
    % calculate
    for i = 1:MAX-1
        v(i+1) = v(i) + ((P/(m*v(i))) * dt) - (((C*rho*A*v(i)*v(i))/(2*m))*dt);
        t(i+1) = t(i) + dt;
        
        if (t(i+1) > 200)
            t(i+1) = 200;
            break
        end
    end
end