clear all
close all
clc
r_1=1;wc=pi/4;r_2=.9;
z=[1 -r_1*exp(wc*i)];p=[1 -r_2*exp(wc*i)];
w=linspace(-pi,pi,100);
h=freqz(conv(z',z),1,w);h_1=freqz(conv(z',z),conv(p',p),w);
max1=max(abs(h));max2=max(abs(h_1));
figure
zplane(conv(z',z),1)
figure
zplane(conv(z',z),conv(p',p))
figure
subplot(211);plot(w,abs(h)/max1);hold on;plot(w,abs(h_1)/max2);grid on;
subplot(212);plot(w,angle(h));hold on;plot(w,angle(h_1));grid on;
