% Program plots the trajectory of Earth's orbit with the
% Sun using the euler-cromer method ( **circular orbit** )

% reset
close all
clear variables
clc

% get input value
% prompt1 = 'Number of steps: ';
numOfSteps = 50; % input(prompt1);
% prompt2 = 'Initial x position: ';
xi = 1; % input(prompt2);
% prompt3 = 'Initial y position: ';
yi = 0; % input(prompt3);
% prompt4 = 'Initial x position: ';
vxi = 0; % input(prompt4);
% prompt5 = 'Initial y position: ';
vyi = 2*pi; % input(prompt5);
% prompt6 = 'beta: ';
beta = 2; % input(prompt6);
%prompt7 = 'time step: ';                   % in centi-seconds (0.01)
dt = 0.05; %input(prompt1);                 % 0.05


[x,y,r] = planetary_motion_calc(xi,yi,vxi,vyi,beta,numOfSteps,dt);

hold on;
plot(x,y);
pbaspect([1,1,1]);
hold off;