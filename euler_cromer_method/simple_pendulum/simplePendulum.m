%Figure 3.3: theta as a function of time for a simple pendulum calculated
%using the Euler-Cromer method.

%reset
close all
clear variables
clc

%call calculation functions
[time, theta] = simplePendulum_calc();

%plot data
simplePendulum_plot(time, theta);
