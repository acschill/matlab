% calcs v_y(t)
function [t,v] = vel_t_friction_calc(dtIn,aIn,bIn)
    % max num of runs 
    MAX = 200;
    g = 9.8; % m/s*s
    
    % intialize arrays
    t = zeros(1,MAX);
    v = zeros(1,MAX);
    
    % assign intial values
    dt = dtIn;
    a = aIn;
    b = bIn;
    
    % calculate
    for i = 1:MAX-1
        v(i+1) = v(i) + ((a-b*v(i)) * dt);
        t(i+1) = t(i) + dt;
        
        if (t(i+1) > 10)
            t(i+1) = 10;
            break
        end
    end
end