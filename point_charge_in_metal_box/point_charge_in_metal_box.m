
% Program calculates the electric potential V at points inside a metal box
%   with a  point charge at its center.
% Provides a solution to Poisson's Equation: 
%   (?^2V/?x^2) + (?^2V/?y^2) + (?^2V/?z^2) = -?/?_0
%   using a form of the relaxation method (Gauss-Seidel using SOR - p.142)

% reset
close all
clear variables
clc

[v_initial,rho,size] = initialize_v_and_rho();
[v_final] = calc(v_initial,rho,size);

rounded_v_final = round(v_final,3);
dispn(v_final,2);

 % Plot the electric field distribution
figure;
[ex,ey]=gradient(v_final);
quiver(-ex,-ey);  % quiver() function plots electric field (E = -grad(V) -- hence the negative sign) 
title('Electric field between two metal plates')

function [v_final] = calc(v,rho,size)
    delta_v = 0;
    v_temp = zeros(size,size);
    
    for i = 1:size
        for j = 1:size
            %for k = 1:11
                v_temp(i,j) = v(i,j);
            %end
        end
    end
    
    i = 1;
    
   % && (delta_v < 0.0001)
    while(i <= 5) 
        i = i+1;
        [v_updated,v_old1,delta_v1,rho1] = update(v,v_temp,delta_v,rho,size);
        [v_final,~,delta_v2,~] = update(v_updated,v_old1,delta_v1,rho1,size);
        v = v_final;
        delta_v = delta_v2;
    end

end

function [v2,v1,delta_vOut,rhoOut] = update(v1,v2,delta_vIn,rhoIn,size)
    
    delta_vOut = delta_vIn;
    rhoOut = rhoIn;
    
    for i = 2:(size-1)
       for j = 2:(size-1)
          %for k = 2:10
            temp = v1(i,j);
            v2(i,j) = ((v1(i-1,j) + v1(i+1,j) + v1(i,j+1) + v1(i,j-1) + v1(i,j) + v1(i,j))/4) + ((rhoOut(i,j)*i^2) / 4);
            delta_vOut = delta_vOut + abs(temp - v2(i,j)); 
          %end
       end
    end
    
    delta_vOut = (delta_vOut./(225));
    
end

% sets initial values for V(i,j)
function [v,rho,size] = initialize_v_and_rho()
    size = 41; % make sure it's odd
    center = ((size-1)/2)+1;
    v = zeros(size,size);
    v(center,center) = 1;
    
    rho = zeros(size,size);
    rho(center,center) = 1;
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
