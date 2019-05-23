%Description
function [x,y,z] = curveball_sim_calc()
    S0_m = 4.1e-4;
    v_d = 35;
    delta = 5;
    vi = 102.67;
    w_om = 30; %omega in rev/sec
    delta_t = 0.01;
    g = 32.15;
    

    vx(1) = vi;
    vy(1) = 0;
    vz(1) = 0;
    x(1) = 0;
    y(1) = 3.28; %in feet
    z(1) = 0;

    for i = 1:60
        v(i) = sqrt(vx(i).^2 + vy(i).^2 + vz(i).^2);
        B2_m = ((0.0039) + (0.0058/(1 + exp((v(i) - v_d)/delta))));
        vx(i+1) = vx(i) - (B2_m*v(i)*vx(i)*delta_t);
        vy(i+1) = vy(i) - (g*delta_t);
        vz(i+1) = vz(i) - ((-(S0_m*vx(i)*w_om))*delta_t);
        x(i+1) = x(i) + vx(i)*delta_t;
        y(i+1) = y(i) + vy(i)*delta_t;
        z(i+1) = z(i) + vz(i)*delta_t;
    end

end

