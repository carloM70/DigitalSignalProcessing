clear all
close all
clc
%w_1=pi/4;
z_1=[1 -4];z_2=[1 5];
p_1=[1 .5];p_2=[1 .3];
z_3=[-4 1];z_4=[5 1];
w=linspace(-pi,pi,1000);
h_1=freqz(conv(z_1,z_2),conv(p_1,p_2),w);
h_2=freqz(conv(z_3,z_4),conv(p_1,p_2),w);
h_3=freqz(conv(z_1,z_2),conv(z_3,z_4),w);
h_4=freqz(conv(p_1,p_2),conv(z_3,z_4),w);
zplane(conv(z_1,z_2),conv(p_1,p_2));
figure
zplane(conv(z_3,z_4),conv(p_1,p_2));
figure
zplane(conv(z_1,z_2),conv(z_3,z_4));
figure
subplot(311);plot(w,abs(h_1));grid on;
subplot(312);plot(w,abs(h_2));grid on;
subplot(313);plot(w,abs(h_3));grid on;
figure
subplot(311);plot(w,unwrap(angle(h_1)));grid on;
subplot(312);plot(w,unwrap(angle(h_2)));grid on;
subplot(313);plot(w,unwrap(angle(h_3)));grid on;
figure
plot(w,unwrap(angle(h_2))+unwrap(angle(h_3)));grid on
figure
subplot(211);plot(w,abs(h_4));grid on;
subplot(212);plot(w,abs(h_4).*abs(h_1));grid on;
figure
subplot(311);plot(w,unwrap(angle(h_4)));grid on;
subplot(312);plot(w,unwrap(angle(h_1))+unwrap(angle(h_4)));grid on
