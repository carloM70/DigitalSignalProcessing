clear all
close all
clc
r_1=.9;wc_1=3*pi/4;r_2=.8;wc_2=5*pi/4;
z_1=[1 1];z_2=[1 -1];
p_1=[1 -r_1*exp(wc_1*i)];p_2=[1 -r_2*exp(wc_2*i)];
w=linspace(-pi,pi,100);
h=freqz(conv(z_1,z_2),conv(p_1,p_2),w);
max1=max(abs(h));
figure
zplane(conv(z_1,z_2),conv(p_1,p_2))
figure
subplot(211);plot(w,abs(h)/max1);grid on;
subplot(212);plot(w,angle(h));grid on;
