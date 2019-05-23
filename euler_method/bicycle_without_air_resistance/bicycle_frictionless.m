
% Program calculates the change in velocity of a person riding
% a bicycle at varying times **this is a frictionless example**

% reset
close all
clear variables
clc

% get input value
prompt1 = 'time step: ';                               % in centi-seconds (0.01)
dt = input(prompt1);                                    % 0.05
prompt2 = 'Power value (Watts): ';                     % in watts
P = input(prompt2);                                     % 400
prompt3 = 'Mass value (Kilograms): ';                  % in kilograms (mass of bicycle + rider)
m = input(prompt3);                                     % 70
prompt4 = 'Initial velocity (meters/sec): ';           % in meters/sec
vi = input(prompt4);                                    % 4

% calc calc function
[t,v] = bicycle_calc(dt,P,m,vi);