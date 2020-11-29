clear all
close all
clc
L=8;R=1;        
b=[1 0 0 0 0 0 0 0 R^L];
w=linspace(-pi,pi,1000);
H=freqz(b,1,w);
zplane(b,1)
figure
subplot(211);plot(w,abs(H));grid on;
subplot(212);plot(w,angle(H));grid on;


