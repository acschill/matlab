%Description
function [x_coord,y_coord,z_coord] = curveball_calc()
    S0_m = 4.1e-4;
    v_d = 35;
    delta = 5;
    vel_i = 102.67; %initial velocity value
    w_om = 30; %omega in rev/sec
    delta_t = 0.01;
    grav = 32.15; %in feet
    
    vel_x(1) = vel_i; %initial x velocity value
    vel_y(1) = 0; %initial y velocity value
    vel_z(1) = 0; %initial z velocity value
    x_coord(1) = 0; %initial x position value, in feet
    y_coord(1) = 3.28; %initial y position value, in feet
    z_coord(1) = 0; %initial z position value, in feet

    for i = 1:60
        vel(i) = sqrt(vel_x(i).^2 + vel_y(i).^2 + vel_z(i).^2);
        B2_m = ((0.0039) + (0.0058/(1 + exp((vel(i) - v_d)/delta))));
        vel_x(i+1) = vel_x(i) - (B2_m*vel(i)*vel_x(i)*delta_t);
        vel_y(i+1) = vel_y(i) - (grav*delta_t);
        vel_z(i+1) = vel_z(i) - ((-(S0_m*vel_x(i)*w_om))*delta_t);
        x_coord(i+1) = x_coord(i) + vel_x(i)*delta_t;
        y_coord(i+1) = y_coord(i) + vel_y(i)*delta_t;
        z_coord(i+1) = z_coord(i) + vel_z(i)*delta_t;
    end

end

