% calcs v_y(t)
function [x,y] = baseball_with_winds_calc(dtIn,viIn,thetaIn,wind)
    % max num of runs 
    MAX = 2343;
    g = 9.8; % m/s*s
   
    % assign intial values
    dt = dtIn;
    v_d = 35; %m/s
    del = 5;  %m/s
    v_wind = wind;
    theta = thetaIn*(pi/180);
    x(1) = 0;
    y(1) = 1;
    v(1) = viIn;
    vx(1) = viIn*cos(theta);
    vy(1) = viIn*sin(theta);
    b2_m(1) = 0.0039 + (0.0058/(1+exp((v(1)-v_d)/del)));
    fdrag_x(1) = -b2_m*abs(v(1)-v_wind)*(vx(1)-v_wind);
    fdrag_y(1) = -b2_m*abs(v(1)-v_wind)*(vy(1)-v_wind);
    flag = 0;
    
    % calculate
    for i = 1:MAX-1

        v(i) = sqrt(vx(i).^2 + vy(i).^2); %recalculate vi
        b2_m = ((0.0039) + (0.0058/(1 + exp((v(i) - v_d)/del))));
        vx(i+1) = vx(i) - (b2_m*v(i)*(vx(i) - v_wind)*dt);
        vy(i+1) = vy(i) - (g*dt) - (b2_m*(v(i))*vy(i)*dt);
        x(i+1) = x(i) + vx(i)*dt;
        y(i+1) = y(i) + vy(i)*dt;


        if (y(i+1) < 0)
            flag = 1;
            r = -y(i)/y(i+1);
            x_l = (x(i) + (r*x(i+1)))/(r+1);
            x(i+1) = x_l;       % landing point on x axis
            y(i+1) = 0;         % landing point on y axis
            
        end
        
        if flag == 1
            break;
        end
    end
    %x = x.*2.23694;
    %y = y.*2.23694;
end

