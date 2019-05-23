% calcs v_y(t)
function [xIso,yIso,xAdia,yAdia] = canon_shell_moreAccurate_calc(dtIn,viIn,thetaIn,b2_mIn)
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
    xIso(1) = 0;
    yIso(1) = 0; %10^4; % y_0 = (k_B*T/m*g)
    xAdia(1) = 0;
    yAdia(1) = 0; %10^4; % y_0 = (k_B*T/m*g)
    vIso(1) = viIn;
    vxIso(1) = viIn*cos(theta);
    vyIso(1) = viIn*sin(theta);
    vAdia(1) = viIn;
    vxAdia(1) = viIn*cos(theta);
    vyAdia(1) = viIn*sin(theta);
    b2_m = b2_mIn;
    rho_isothermal(1) = 1.225; %kg/m^3
    rho_adiabatic(1) = 1.225; %kg/m^3
    fdrag_xIso(1) = -b2_m*abs(vIso(1))*vxIso(1);
    fdrag_yIso(1) = -b2_m*abs(vIso(1))*vyIso(1);
    fdrag_xAdia(1) = -b2_m*abs(vAdia(1))*vxAdia(1);
    fdrag_yAdia(1) = -b2_m*abs(vAdia(1))*vyAdia(1);
    a = 6.5*10^-3; %K/m
    alpha = 2.5; %(for air)
    T_0 = 273.15;
    flagIso = 0;
    flagAdia = 0;
    
    % calculate
    for i = 1:MAX-1
        
      if flagIso == 0
        xIso(i+1) = xIso(i) + vxIso(i)*dt;
        yIso(i+1) = yIso(i) + vyIso(i)*dt;
        rho_isothermal(i+1) = rho_isothermal(i)*exp(-yIso(i)/10^4);
        fdrag_xIso(i+1) = -b2_m*(rho_isothermal(i+1)/rho_isothermal(i))*abs(vIso(i))*vxIso(i);
        fdrag_yIso(i+1) = -b2_m*(rho_isothermal(i+1)/rho_isothermal(i))*abs(vIso(i))*vyIso(i);
        vxIso(i+1) = vxIso(i) + fdrag_xIso(i)*dt;
        vyIso(i+1) = vyIso(i) + (-g + fdrag_yIso(i))*dt;
        vIso(i+1) = sqrt(vxIso(i).^2 + vyIso(i).^2);
        
        if (yIso(i+1) < 0)
            flagIso = 1;
            r = -yIso(i)/yIso(i+1);
            x_l = (xIso(i) + (r*xIso(i+1)))/(r+1);
            xIso(i+1) = x_l;       % landing point on x axis
            yIso(i+1) = 0;         % landing point on y axis     
        end
      end  
        
      if flagAdia == 0
        xAdia(i+1) = xAdia(i) + vxAdia(i)*dt;
        yAdia(i+1) = yAdia(i) + vyAdia(i)*dt;
        rho_adiabatic(i+1) = rho_adiabatic(i)*((1-((a*yAdia(i))/T_0))^alpha);
        fdrag_xAdia(i+1) = -b2_m*(rho_adiabatic(i+1)/rho_adiabatic(i))*abs(vAdia(i))*vxAdia(i);
        fdrag_yAdia(i+1) = -b2_m*(rho_adiabatic(i+1)/rho_adiabatic(i))*abs(vAdia(i))*vyAdia(i);
        vxAdia(i+1) = vxAdia(i) + fdrag_xAdia(i)*dt;
        vyAdia(i+1) = vyAdia(i) + (-g + fdrag_yAdia(i))*dt;
        vAdia(i+1) = sqrt(vxAdia(i).^2 + vyAdia(i).^2);
        
        if (yAdia(i+1) < 0)
            flagAdia = 1;
            r = -yAdia(i)/yAdia(i+1);
            x_l = (xAdia(i) + (r*xAdia(i+1)))/(r+1);
            xAdia(i+1) = x_l;       % landing point on x axis
            yAdia(i+1) = 0;         % landing point on y axis
            
        end
      end 
      
      if (flagIso == 1) && (flagAdia == 1)
          break;
      end
        
    end
    xIso = xIso.*10^-3;
    yIso = yIso.*10^-3;
    
    xAdia = xIso.*10^-3;
    yAdia = yIso.*10^-3;
end

