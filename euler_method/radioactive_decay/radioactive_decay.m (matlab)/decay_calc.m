% calc radioactive decay of uranium using euler method
function [t,nuclei] = decay_calc(n_uranium,ini_t,tauIn,dtIn)
    % max num of runs 
    MAX = 100;
    
    % intialize arrays
    t = zeros(1,MAX);
    nuclei = zeros(1,MAX);
    
    % assign intial values
    t(1) = ini_t;
    nuclei(1) = n_uranium;
    tau = tauIn;
    dt = dtIn;
    
    % calculate
    for i = 1:MAX-1
        nuclei(i+1) = nuclei(i) - (nuclei(i) / tau) * dt;
        t(i+1) = t(i) + dt;
    end

end