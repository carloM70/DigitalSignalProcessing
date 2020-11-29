clear all
close all
clc
r_1=.8;w_1=pi/4;r_2=.7;w_2=pi/3;
z_1=[-r_1*exp(w_1*i) 1];p_1=[1 -r_1*exp(w_1*i)];
z_2=[-r_1*exp(-w_1*i) 1];p_2=[1 -r_1*exp(-w_1*i)];
w=linspace(-pi,pi,1000);
H=freqz(conv(z_1,z_2),conv(p_1,p_2),w);
zplane(conv(z_1,z_2),conv(p_1,p_2))
figure
subplot(211);plot(w,abs(H));grid on;
subplot(212);plot(w,angle(H));grid on;
