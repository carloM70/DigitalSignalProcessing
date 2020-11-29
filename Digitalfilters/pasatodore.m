clear all
close all
clc
a=[-.8 1];
b=[1 -.8];
w=linspace(-pi,pi,1000);
H=freqz(a,b,w);
zplane(a,b)
figure
subplot(211);plot(w,abs(H));grid on;
subplot(212);plot(w,angle(H));grid on;
