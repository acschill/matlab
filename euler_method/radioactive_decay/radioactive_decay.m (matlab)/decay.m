
% Program calculates radioactive decay of uranium using euler method

% reset
close all
clear variables
clc

% get input values
prompt1 = 'initial number of nuclei: ';
n_uranium = input(prompt1);     % 10,000

prompt2 = 'time constant: ';
tau = input(prompt2);    % 1

prompt3 = 'time step: ';
dt = input(prompt3);    % 0.05

%intial time
t = 1;

% calc calc function
[t,n_uranium] = decay_calc(n_uranium,t,tau,dt);