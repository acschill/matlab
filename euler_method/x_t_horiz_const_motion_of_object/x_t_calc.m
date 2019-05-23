% calcs x(t)
function [t,x] = x_t_calc(dtIn,v_xini)
    % max num of runs 
    MAX = 205;
    
    % intialize arrays
    t = zeros(1,MAX);
    x = zeros(1,MAX);
    
    % assign intial values
    %vy_t(1) = y_0;
    dt = dtIn;
    v_xi = v_xini;
    
    % calculate
    for i = 1:MAX-1
        x(i+1) = x(i) + v_xi * dt;
        t(i+1) = t(i) + dt;
        
        if (t(i+1) > 10)
            t(i+1) = 10;
            break
        end
    end
end