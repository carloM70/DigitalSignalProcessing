clear all
close all
clc
%especificaciones de filtro digital 
wp=0.25*pi;%frecuencia de banda de paso digital en rad
ws=0.4*pi;%frecuencia de banda de rechazo digital en rad
Ap=1;%riple de pasabanda en dB
As=30;%atenuacion en dB
%especificaciones de prototipo analogico
T=2;Fs=1/T;%poner T=1
OmegaP=(2/T)*tan(wp/2);%frecuencia de pasabanda del prototipo
OmegaS=(2/T)*tan(ws/2);%frecuencia de rechazabanda del prototipo
%hallamos parametros del filtro
[N,OmegaC]=cheb2ord(OmegaP,OmegaS,Ap,As,'s');
[C,D]=cheby2(N,As,OmegaC,'s');
[b,a]=bilinear(C,D,Fs);
%reresentacion espectral
w=linspace(0,pi,1000);
H=freqz(b,a,w);
subplot(211);plot(w/pi,abs(H));grid on;
subplot(212);plot(w/pi,angle(H));grid on;
figure
freqz(b,a)