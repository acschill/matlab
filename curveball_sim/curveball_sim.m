%Description

%reset
close all
clear variables
clc

%call calculation functions
[x,y,z] = curveball_sim_calc();

%plot data
curveball_sim_plot(x,y,z);
