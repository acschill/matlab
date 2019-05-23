
% Program calculates the change in position in two dimensions
% of a baseball hit by a batter (w/ 2 different wind resistances)

% reset
close all
clear variables
clc

% get input value
%prompt1 = 'time step: ';                               % in centi-seconds (0.01)
dt = 0.05;%input(prompt1);                                    % 0.05
%prompt2 = 'Initial velocity (meters/sec): ';           % in meters/sec
vi = 49.1744;%input(prompt2);                                    % 700
%prompt3 = 'Theta (degrees): ';                         % in degrees
theta = 35;%input(prompt3);                                 % 30,35,40,45,50,55


% calc calc function
[x1,y1] = baseball_with_winds_calc(dt,vi,theta,-4.47);
[x2,y2] = baseball_with_winds_calc(dt,vi,theta,0);
[x3,y3] = baseball_with_winds_calc(dt,vi,theta,4.47);

baseball_with_winds_plot(x1,y1,x2,y2,x3,y3);

