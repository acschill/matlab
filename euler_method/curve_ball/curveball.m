%Description

%reset
close all
clear variables
clc

%call calculation functions
[x,y,z] = curveball_calc();

%plot data
curveball_plot(x,y,z);
