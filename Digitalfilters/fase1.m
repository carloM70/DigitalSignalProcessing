clear all
close all
clc
w_1=pi/4;
z_1=[1 1/2];z_2=[1 -1/4*exp(i*w_1)];z_3=[1 -1/4*exp(-i*w_1)];z_4=[1/2 1];z_5=[-1/4*exp(i*w_1) 1];z_6=[-1/4*exp(-i*w_1) 1];
w=linspace(-pi,pi,1000);
h_1=freqz(conv(conv(z_1,z_2),z_3),1,w);h_2=freqz(conv(conv(z_4,z_5),z_6),1,w);
zplane(conv(conv(z_1,z_2),z_3));
figure
zplane(conv(conv(z_4,z_5),z_6));
figure
subplot(211);plot(w,abs(h_1));grid on;
subplot(212);plot(w,abs(h_2));grid on;
figure
subplot(211);plot(w,unwrap(angle(h_1)));grid on;
subplot(212);plot(w,unwrap(angle(h_2)));grid on;
