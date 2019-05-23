
% Program calculates the strength of the magnetic field B 
% at a general point produced by a solenoid 

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
B_y = squeeze(B_result(2,:,:));
B_z = squeeze(B_result(3,:,:));

% fig = figure();
quiver(B_z,B_x);
% title('Magnetic field from a solenoid');


function [B] = calc(B,max,scale,step)

   for i1 = 1:scale
       for j1 = 1:scale
          [bx,by,bz] = calc_field(max,(i1-max-1)/max,0,(j1-max-1)/max,step);
          B(1,i1,j1) = bx;
          B(2,i1,j1) = by;
          B(3,i1,j1) = bz;
       end
   end
   
   for i2 = 1:scale
       for j2 = 1:scale
          [bx,by,bz] = calc_field(max,(i2-max-1)/max,j2,0,step);
          B(1,i2,j2) = bx;
          B(2,i2,j2) = by;
          B(3,i2,j2) = bz;
       end 
   end 
   
end

function [bx,by,bz] = calc_field(max,x,y,z,step)
    
    r = 0.5;
    turns = 80;
    l = 2;
    del_theta = (2*pi)/step;
    theta_max = 2*pi-del_theta;
    
    bx = 0;
    by = 0;
    bz = 0;

    for theta = 0:del_theta:theta_max
        dlx = -r*del_theta*sin(theta);
        dly = r*del_theta*cos(theta);
        dlz = del_theta*l*(theta/(2*turns*pi)); 
        rx = x - r*cos(theta);
        ry = y - r*sin(theta);
        rz = z - l*(theta/(2*turns*pi));   
        
        r = sqrt(rx^2 + ry^2 + rz^2);
        
        if (r > (1/max))                                            
            bx = bx + ((dly*rz - dlz*ry) / r^3);   %  NEW!!! %      % Biot-Savart law (cross product)
            by = by - ((dlz*rx - dlx*rz) / r^3);   %  NEW!!! %
            bz = bz + ((dlx*ry - dly*rx) / r^3);    
        end
    end

end