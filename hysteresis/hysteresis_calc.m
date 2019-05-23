%Description
function [x,y,z] = hysteresis_calc()
    %definitions:
    %H = magnetic field strength - x axis
    %B = magnetic induction/magnetic flux density - y axis
    %dB = change of induction
    %F = magnetomotive force
    %E = E field
    %I_c = magnetic circuit length
    %A_c = cross sectional area of the core
    %I = current
    %N = number of turns
    %Psi = flux
    %dt = time step
    %I_L = top current
    %V_L = voltage over the winding
    %V_R = resistor voltage
    %f = frequency
    %R = shunt resistor
    %R_i = integrator resistance
    %R_n = ?
    %C_i = integrator capacitor
    
    
    H = (I*N)/I_c;
    Psi = B*A_c;
    E = -N*diff(Psi); %wrt dt
    dB = (dt*E)/(-N*A_c);
    B(t) = int((E(t)*dt)/(-N*A_c),t);
    N = (I_c*B)/(I_L*mu_c);
    f = (V_L*I_c)/(2*pi*N^2*mu_c*A_c*I_L);
    H = (V_R*N)/(R*I_c);
    C_i = (N*A_c)/R_i;
    R_i = (A_c*N)/C_i;
    B = Psi/(N*A_c);
    
    
    
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

