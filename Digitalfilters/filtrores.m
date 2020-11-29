clear all
close all
clc
r=.9;wc=pi/4;
p=[1 -r*exp(wc*i)];
w=linspace(-pi,pi,100);
h=freqz(1,conv(p',p),w);
max1=max(abs(h));
figure
zplane(1,conv(p',p))
figure
subplot(211);plot(w,abs(h)/max1);grid on;
subplot(212);plot(w,angle(h));grid on;
