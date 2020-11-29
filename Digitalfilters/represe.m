clear all
close all
clc
f=10;Fs=150;
t=0:.0001:1;
xa=cos(2*pi*f*t);
t_1=0:1/Fs:1;n=0:length(t_1)-1;
xs=cos(2*pi*f*t_1);
subplot(211);plot(t,xa);grid on;
subplot(212);stem(n,xs);grid on;
%frecuencia
nfft=1024;
h=fft(xs,nfft);
h_1=h(1:nfft/2);
frec=(0:nfft/2-1)*Fs/nfft;
figure
subplot(311);plot(frec,abs(h_1));grid on;
subplot(312);plot(frec,angle(h_1));grid on;
subplot(313);plot(frec/Fs,abs(h_1));grid on;
