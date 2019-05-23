%performs calculations for simple pendulum 
function [time,theta] = simplePendulum_calc()
delta_t = 0.04; %time step in seconds
length = 1; %in meters
grav = 9.8;

w_om(1) = 0;
theta(1) = 0.2; %in radians
time(1) = 0;

    for i = 1:500
        w_om(i+1) = w_om(i) - (grav/length)*theta(i)*delta_t;
        theta(i+1) = theta(i) + w_om(i+1)*delta_t;
        time(i+1) = time(i) + delta_t;
    end
end
