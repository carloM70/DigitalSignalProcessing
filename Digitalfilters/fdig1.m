clear all
close all
clc
%especificaciones de filtro digital 
wp=0.2*pi;%frecuencia de banda de paso digital en rad
ws=0.3*pi;%frecuencia de banda de rechazo digital en rad
Ap=1;%riple de pasabanda en dB
As=15;%atenuacion en dB
[N,OmegaC]=buttord(wp/pi,ws/pi,Ap,As);
[C,D]=butter(N,OmegaC);
%[b,a]=bilinear(C,D,Fs);
%reresentacion espectral
w=linspace(0,pi,1000);
H=freqz(C,D,w);
subplot(211);plot(w/pi,abs(H));grid on;
subplot(212);plot(w/pi,angle(H));grid on;
%figure
%freqz(b,a)
