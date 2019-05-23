% calcs v_y(t)
function [t1,v1,t2,v2] = fig2_2_calc(dtIn,powerIn,massIn,viIn)
    % max num of runs 
    MAX = 4000;
    %g = 9.8; % m/s*s
    
    % intialize arrays
    t1 = zeros(1,MAX);
    v1 = zeros(1,MAX);
    t2 = zeros(1,MAX);
    v2 = zeros(1,MAX);
    
    % assign intial values
    dt = dtIn;
    P = powerIn;
    m = massIn;
    v1(1) = viIn;
    v2(1) = viIn;
    A = 0.33;           % meters squared
    C = 1;
    rho = 1.225;        % kg/m^3
    
    % calculate
    % w/o air resistance
    for i = 1:MAX-1
        v1(i+1) = v1(i) + ((P/(m*v1(i))) * dt);
        t1(i+1) = t1(i) + dt;
        
        if (t1(i+1) > 200)
            t1(i+1) = 200;
            break
        end
    end
    
    % w/ air resistance
   for i = 1:MAX-1
        v2(i+1) = v2(i) + ((P/(m*v2(i))) * dt) - (((C*rho*A*v2(i)*v2(i))/(2*m))*dt);
        t2(i+1) = t2(i) + dt;
        
        if (t2(i+1) > 200)
            t2(i+1) = 200;
            break
        end
    end
end