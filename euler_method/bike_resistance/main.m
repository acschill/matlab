
% Program calculates and compares the change in velocity of a person 
% riding a bicycle at varying times (both w/ & w/o air resistance)

% reset
close all
clear variables
clc

% get input value
%prompt1 = 'time step: ';                               % in centi-seconds (0.01)
dt = 0.05; %input(prompt1);                                    % 0.05
%prompt2 = 'Power value (Watts): ';                     % in watts
P = 400; %input(prompt2);                                     % 400
%prompt3 = 'Mass value (Kilograms): ';                  % in kilograms (mass of bicycle + rider)
m = 70; %input(prompt3);                                     % 70
%prompt4 = 'Initial velocity (meters/sec): ';           % in meters/sec
vi = 4; %input(prompt4);                                    % 4

% calc calc function
[t1,v1,t2,v2] = fig2_2_calc(dt,P,m,vi);

% plotting info
hold on;

% title adjustiments
t = title('Bicycle simulation: velocity vs. time','FontWeight','Normal'); % set title w/o bold
t.FontName = 'Arial';      % change title font type
t.FontSize = 14;

% plot data
plot(t1,v1,'LineWidth',2);          % w/o air resistance
plot(t1,v2,':r','LineWidth',2);     % w/ air resistance

% x axis adjustiments
xl = xlabel('time (s)');            
xl.FontName = 'Arial';
xl.FontSize = 14;
xticks(0:50:200);

% y axis adjustiments
yl = ylabel('velocity (m/s)');      % y axis title
yl.FontName = 'Arial';
yl.FontSize = 14;
yticks(0:10:50);

% added graph texts
text(10,35,'No air resistance','FontName','Arial','FontSize',14);
text(75,9,'With air resistance','FontName','Arial','FontSize',14);

box on;
hold off;