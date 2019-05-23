%Description
function [x,y] = circularstadium_calc(xini,yini,angle,vi,alpha)
  
    v_d = 35;
    delta = 5;
    delta_t = 0.01;
    g = 9.8;

    theta = (angle*pi)/180;
    v(1) = vi;
    vx(1) = vi*cos(theta);
    vy(1) = vi*sin(theta);
    x(1) = xini; %0.2
    y(1) = yini; %0
    
%     norm_x(1) = ((xini-alpha)/sqrt((x-alpha).^2+(y).^2));
%     norm_y(1) = (y/sqrt((x-alpha).^2+(y).^2));
    for i = 1:50
       
        v(i+1) = sqrt(vx(i).^2 + vy(i).^2);
        B2_m = ((0.0039) + (0.0058/(1 + exp((v(i) - v_d)/delta))));
        vx(i+1) = vx(i) - (B2_m*v(i)*vx(i)*delta_t);
        vy(i+1) = vy(i) - (g*delta_t) - (B2_m*(v(i))*vy(i)*delta_t);
        x(i+1) = x(i) + vx(i)*delta_t;
        y(i+1) = y(i) + vy(i)*delta_t;

    
        %check if there's been a collision (i.e. if (x,y) is out of table)
        
        while(1 < sqrt((x(i+1)).^2+(y(i+1)).^2)) % == out of circle
           delta_t = delta_t - 0.0001;
           v(i+1) = sqrt(vx(i).^2 + vy(i).^2);
           B2_m = ((0.0039) + (0.0058/(1 + exp((v(i) - v_d)/delta))));
           vx(i+1) = vx(i) - (B2_m*v(i)*vx(i)*delta_t);
           vy(i+1) = vy(i) - (g*delta_t) - (B2_m*v(i)*vy(i)*delta_t);
           x(i+1) = x(i) + vx(i)*delta_t;
           y(i+1) = y(i) + vy(i)*delta_t;
        end
           delta_t = 0.01;
           norm = sqrt((x(i+1)).^2+(y(i+1)).^2);
           norm_x = x(i+1);
           norm_y = y(i+1);
           theta = acos((vx(i+1)*norm_x + vy(i+1)*norm_y)/(sqrt(norm_x.^2+norm_y.^2))*(sqrt(vx(i+1).^2+vy(i+1).^2)));
           
           vi_perp = abs(norm)*(abs(v(i+1))*cos(theta)*norm_x + abs(v(i+1))*sin(theta)*norm_y);
           vi_parall = v(i)-vi_perp;
           vf_perp = -vi_perp;
           vf_parall = vi_parall;

           vx(i+1) = -vi_perp;
           vy(i+1) = vi_parall;
           x(i+1) = x(i) + vx(i)*delta_t;
           y(i+1) = y(i) + vy(i)*delta_t;
           
        
     end
  end

    
    
    
    
    
    
    
    
    