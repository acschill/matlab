
% Program calculates change in velocity 
% of a falling object near Earth's surface
% *attached to a parachute* wrt time (calcs v(t))
% (This considers the frictional force)

% reset
close all
clear variables
clc

% get input value
prompt1 = 'time step: ';                        % in centi-seconds (0.01)
dt = input(prompt1);                            % 0.05
prompt2 = 'gravitational component (a): ';      
a = input(prompt2);                             % 10
prompt3 = 'frictional force component (b): ';   
b = input(prompt3);                             % 1

% calc calc function
[t,v] = vel_t_friction_calc(dt,a,b);