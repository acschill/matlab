
% Program calculates change in velocity 
% of a falling object near Earth's surface
% wrt time (calcs v(t))

% reset
close all
clear variables
clc

% get input value
prompt3 = 'time step: ';      % in centi-seconds (0.01)
dt = input(prompt3);          % 0.05


% calc calc function
[t,vy_t] = vel_t_calc(dt);