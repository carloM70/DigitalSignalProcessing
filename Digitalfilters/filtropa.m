clear all
close all
clc
r=.9;wc=3*pi/4;
z=[1];z_1=[1 -1];p=[1 -r*exp(wc*i)];
w=linspace(-pi,pi,100);
h=freqz(z,conv(p',p),w);h_1=freqz(z_1,conv(p',p),w);
max1=max(abs(h));max2=max(abs(h_1));
figure
zplane(z,conv(p',p))
figure
zplane(z_1,conv(p',p))
figure
subplot(211);plot(w,abs(h)/max1);hold on;plot(w,abs(h_1)/max2);grid on;
subplot(212);plot(w,angle(h));hold on;plot(w,angle(h_1));grid on;
