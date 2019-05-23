%Description
%calculates omega vs time values
function [time, w_om] = omegavstime_calc(F_D)
    delta_t = 0.04;
    length = 9.8;
    g = 9.8;

    w_om(1) = 0;
    theta(1) = 0.2;
    time(1) = 0;
    Om_D = 0.667;
    q = 0.5;



    for i = 1:1500
        
        w_om(i+1) = w_om(i) + (-(g/length)*sin(theta(i))-q*w_om(i)+F_D*sin(Om_D*time(i)))*delta_t;
        theta(i+1) = theta(i) + w_om(i+1)*delta_t;

        if(theta(i+1)>pi)
            theta(i+1) = theta(i+1) - 2*pi;
        end
        
        if(theta(i+1)<-pi)
            theta(i+1) = theta(i+1) + 2*pi;
        end
        
        time(i+1) = time(i) + delta_t;
    end
end

