%Description
%Fig. 3.6 omega vs time graph

%reset
close all
clear variables
clc

%call calculation functions
[time1, w_om1] = omegavstime_calc(0);
[time2, w_om2] = omegavstime_calc(0.5);
[time3, w_om3] = omegavstime_calc(1.2);

%plot data
omegavstime_plot(time1, w_om1, time2, w_om2, time3, w_om3);
