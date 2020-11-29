clear all
close all
clc
L=8;R=0.98;
a_1=[1 0 0 0 0 0 0 0 R^L];
a_2=[1 0 0 0 0 0 0 0 -R^L];
w=linspace(-pi,pi,1000);
H_1=freqz(1,a_1,w);H_2=freqz(1,a_2,w);
figure
zplane(1,a_1)
figure
zplane(1,a_2)
figure
subplot(211);plot(w,abs(H_1));hold on;plot(w,abs(H_2));grid on;
subplot(212);plot(w,angle(H_1));hold on;plot(w,angle(H_2));grid on;
