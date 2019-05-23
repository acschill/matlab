
% Program calculates change in position 
% of an object moving horizontally
% at a constant velocity (calcs x(t))

% reset
close all
clear variables
clc

% get input value
prompt1 = 'time step: ';            % in centi-seconds (0.01)
dt = input(prompt1);                % 0.05
prompt2 = 'initial velocity: ';     % in meters/sec
v_xini = input(prompt2);                % 40


% calc calc function
[t,x] = x_t_calc(dt,v_xini);