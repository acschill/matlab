
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
[xIso1,yIso1,xAdia1,yAdia1] = canon_shell_moreAccurate_calc(dt,vi,theta,b2_m);
[xIso2,yIso2,xAdia2,yAdia2] = canon_shell_moreAccurate_calc(dt,vi,45,b2_m);
[x1,y1] = canon_shell_NoDensityCorrection_calc(dt,vi,theta,b2_m);
[x2,y2] = canon_shell_NoDensityCorrection_calc(dt,vi,45,b2_m);


plot(xIso1,yIso1,xAdia1,yAdia1,xIso2,yIso2,xAdia2,yAdia2,x1,y1,x2,y2);

