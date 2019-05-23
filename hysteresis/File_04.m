close all
clear all
clc
f = 50;
Fs = 50000;
t = 0:1/Fs:.02-1/Fs;

V_I = xlsread('blah.xlsx');% Values from aquired data

V = V_I(1:50000,1);
I = V_I(1:50000,2);

V = reshape(V,1000,50);
I = reshape(I,1000,50);
V_ave(1:1000 , 1) = 0;
I_ave(1:1000 , 1) = 0;
temp (1:1000 , 1) = 0;

for x = 1 : 50
    temp = V(1:1000,x);
    V_ave = V_ave + temp;
    temp = I(1:1000,x);
    I_ave = I_ave + temp;
end
V = V_ave'/50;
I = I_ave'/50;

Np = 55;            %Number of Primaray Turns
Ns = 55;            %Number of Secondary Turns
Lfe = .076;       %Effective magnetic length of the core
Sfe = 5.9e-5;    %Effective magnetic crossectional area
H = Np*I/Lfe;       %magnetic field Strength
B = [];

plot(t,I,'-')
hold on
plot(t,V,'--')
legend('I','V')
xlabel('t')

dB = V/(Ns*Sfe);


for xx = 1: 1 : length(dB)
  B(xx) = (trapz(dB(1:xx),2)/length(dB));
end
B = (B - mean(B))/50;
b_m = B *10000;
h_m = H * 0.01256637061436;
figure()
plot(h_m,b_m,'r','linewidth',1);

title('B-H Curve')
xlabel('H-Field Oe')
ylabel('B-Field Gauss')
axis([-20 20 -3000 3000]);

%%
f = 50; %Signal Frequency
Fs = 50000;
t = 0:1/Fs:.02; %Simulate one cycle of a 50 Hz signal
I = 3*sin(2*pi*f*t); %Input current

Np = 55;            %Number of Primaray Turns
Ns = 55;            %Number of Secondary Turns
Lfe = .076;       %Effective magnetic length of the core
Sfe = 5.9^-5;    %Effective magnetic crossectional area
H = Np*I/Lfe;       %magnetic field Strength
H = H * 0.01256637061436;
B = [];



V = (((sin(2*pi*f*t + pi/2 + .2)).^ 101)); %Induced Voltage based on Measurments

figure()
plot(t,I)
hold on
plot(t,V,'--')

legend('Current','V1');

dB = V/(Ns*Sfe);


for xx = 1: 1 : length(dB)
  B(xx) = (trapz(dB(1:xx),2)/length(dB));

end
B = B - mean(B);

B = B/(max(B));
B = 2800*B;

figure()
plot(H,B,'g');

axis([-30 30 -3000 3000]);
title('B-H Curve')
xlabel('H - Oe')
ylabel('B - Gauss')

%%
figure()
plot(h_m,b_m,'k','linewidth',1.5)
hold on
plot(H,B,'b--','linewidth',1.5)
axis([-30 30 -3000 3000]);
title('B-H Curve')
xlabel('H - Oe')
ylabel('B - Gauss')
legend('measured','model')