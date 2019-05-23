% calcs v_y(t)
function [t,vy_t] = vel_t_calc(dtIn)
    % max num of runs 
    MAX = 205;
    g = 9.8; % m/s*s
    
    % intialize arrays
    t = zeros(1,MAX);
    vy_t = zeros(1,MAX);
    
    % assign intial values
    %vy_t(1) = y_0;
    dt = dtIn;
    
    % calculate
    for i = 1:MAX-1
        vy_t(i+1) = vy_t(i) + g * dt;
        t(i+1) = t(i) + dt;
        
        if (t(i+1) > 10)
            t(i+1) = 10;
            break
        end
    end
end