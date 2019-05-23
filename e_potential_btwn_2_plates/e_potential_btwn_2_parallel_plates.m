
% Program calculates the electric potential V at points across a 2D box.
% Provides a solution to Laplace's Equation (?^2V/?x^2) + (?^2V/?y^2) + (?^2V/?z^2) = 0
% using the relaxation method.

% reset
close all
clear variables
clc

[v_initial] = initialize_v();
[v_final] = calc(v_initial);

rounded_v_final = round(v_final,3);
dispn(v_final,2);

 % Plot the electric field distribution
figure;
[ex,ey]=gradient(v_final);
quiver(-ex,-ey);  % quiver() function plots electric field (E = -grad(V) -- hence the negative sign) 
title('Electric field between two metal plates')

function [v_final] = calc(v)
    delta_v = 0;
    v_temp = zeros(7,7);

    for i = 1:7
        for j = 1:7
            v_temp(i,j) = v(i,j);
        end
    end
    
    i = 1;
    
   % && (delta_v < 0.0001)
    while(i <= 5) 
        i = i+1;
        [v_updated,v_old1,delta_v1] = update(v,v_temp,delta_v);
        [v_final,~,delta_v2] = update(v_updated,v_old1,delta_v1);
        v = v_final;
        delta_v = delta_v2;
    end

end

function [v2,v1,delta_vOut] = update(v1,v2,delta_vIn)
    
    delta_vOut = delta_vIn;
    
    for i = 2:6
       for j = 2:6
        temp = v1(i,j);
        v2(i,j) = (v1(i-1,j) + v1(i+1,j) + v1(i,j+1) + v1(i,j-1))/4;
        delta_vOut = delta_vOut + abs(temp - v2(i,j)); 
       end
    end
    
    delta_vOut = (delta_vOut./(225));
    
end

% sets initial values for V(i,j)
function [v] = initialize_v()

    v=[-1.00   -0.67   -0.33   0   0.33   0.67   1.00;
       -1.00      0       0    0     0      0    1.00;
       -1.00      0       0    0     0      0    1.00;
       -1.00      0       0    0     0      0    1.00;
       -1.00      0       0    0     0      0    1.00;
       -1.00      0       0    0     0      0    1.00;
       -1.00   -0.67   -0.33   0   0.33   0.67   1.00];
end

% ref
function [] = dispn(X,N)
[I,J] =   size(X);
    K  = length(N);

    if K == 1   
        N = N * ones(1,J);
    elseif K ~= J
        disp('ERROR: length(N) must either be 1 or equal to the number of columns of X.')
        return
    end

    for i = 1:I
        string = '';

        for j = 1:J 
            if X(i,j) >= 0
                string = [string,'   %.', num2str( N(j) ) ,'f']; %#ok<*AGROW>
            else
                string = [string,'  %.' , num2str( N(j) ) ,'f'];        
            end
        end   
        disp(sprintf(string,X(i,:))); %#ok<DSPS>

    end
end
