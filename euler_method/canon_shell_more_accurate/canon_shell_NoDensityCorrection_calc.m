% calcs v_y(t)
function [x,y] = canon_shell_NoDensityCorrection_calc(dtIn,viIn,thetaIn,b2_mIn)
    % max num of runs 
    MAX = 2343;
    g = 9.8; % m/s*s
    
    % intialize arrays
%     v = zeros(1,MAX);
%     x = zeros(1,MAX);
%     vx = zeros(1,MAX);
%     y = zeros(1,MAX);
%     vy = zeros(1,MAX);
%     fdrag_x = zeros(1,MAX);
%     fdrag_y = zeros(1,MAX);
 
%   t = zeros(1,MAX);

    
    % assign intial values
    dt = dtIn;
    theta = thetaIn*(pi/180);
    x(1) = 0;
    y(1) = 0;
    v(1) = viIn;
    vx(1) = viIn*cos(theta);
    vy(1) = viIn*sin(theta);
    b2_m = b2_mIn;
    fdrag_x(1) = -b2_m*abs(v(1))*vx(1);
    fdrag_y(1) = -b2_m*abs(v(1))*vy(1);
    flag = 0;
    
    % calculate
    for i = 1:MAX-1
        x(i+1) = x(i) + vx(i)*dt;
        y(i+1) = y(i) + vy(i)*dt;
        
        fdrag_x(i+1) = -b2_m*abs(v(i))*vx(i);
        fdrag_y(i+1) = -b2_m*abs(v(i))*vy(i);
        
        vx(i+1) = vx(i) + fdrag_x(i)*dt;
        vy(i+1) = vy(i) + (-g + fdrag_y(i))*dt;
        v(i+1) = sqrt(vx(i).^2 + vy(i).^2);
        
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
    x = x.*10^-3;
    y = y.*10^-3;
end

