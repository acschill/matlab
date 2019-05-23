
% Program calculates the change in position in two dimensions
% of a shell projected out of a canon

% reset
close all
clear variables
clc

% get input value
%prompt1 = 'time step: ';                               % in centi-seconds (0.01)
dt = 0.05;%input(prompt1);                                    % 0.05
%prompt2 = 'Initial velocity (meters/sec): ';           % in meters/sec
vi = 700;%input(prompt2);                                    % 700
%prompt3 = 'Theta (degrees): ';                         % in degrees
theta = 35;%input(prompt3);                                 % 30,35,40,45,50,55
b2_m = 4*10^-5;

% calc calc function
[x1,y1] = canon_shell_projectile_withResistance_calc(dt,vi,30,b2_m);
[x2,y2] = canon_shell_projectile_withResistance_calc(dt,vi,theta,b2_m);
[x3,y3] = canon_shell_projectile_withResistance_calc(dt,vi,40,b2_m);
[x4,y4] = canon_shell_projectile_withResistance_calc(dt,vi,45,b2_m);
[x5,y5] = canon_shell_projectile_withResistance_calc(dt,vi,50,b2_m);
[x6,y6] = canon_shell_projectile_withResistance_calc(dt,vi,55,b2_m);

plot(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6);

