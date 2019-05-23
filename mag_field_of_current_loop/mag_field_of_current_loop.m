
% Program calculates the strength of the magnetic field B at a general
% point produced by a current-carrying loop

% reset
close all
clear variables
clc

max = 7;
scale = 2*max+1; 
step = 20;
B = zeros(3,scale,scale);
[B_result] = calc(B,max,scale,step);

B_x = squeeze(B_result(1,:,:));
B_z = squeeze(B_result(3,:,:));

figure;
quiver(B_x,B_z);
title('Magnetic field from a current loop');


function [B] = calc(B,max,scale,step)

   for i = 1:scale
       for j = 1:scale
          [bx,by,bz] = calc_field(max,(i-max-1)/max,0,(j-max-1)/max,step);
          B(1,i,j) = bx;
          B(2,i,j) = by;
          B(3,i,j) = bz;
       end
   end
   
end

function [bx,by,bz] = calc_field(max,x,y,z,step)
    
    r = 0.5;
    del_theta = (2*pi)/step;
    theta_max = 2*pi-del_theta;
    bx = 0;
    by = 0;
    bz = 0;

    for theta = 0:del_theta:theta_max
        dlx = -r*del_theta*sin(theta);
        dly = r*del_theta*cos(theta);
        rx = x - r*cos(theta);
        ry = y - r*sin(theta);
        rz = z;
        
        r = sqrt(rx^2 + ry^2 + rz^2);
        
        if (r > (1/max))
            bx = bx + (dly*rz / r^3);
            by = by - (dlx*rz / r^3);
            bz = bz + ((dlx*ry - dly*rx) / r^3);
        end
    end

end

