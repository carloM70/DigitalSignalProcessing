clear all
clear all
close all
clc
%bilineal%%%%%%%%%5
%especificaciones de filtro digital 
wp=0.25*pi;%frecuencia de banda de paso digital en rad
ws=0.4*pi;%frecuencia de banda de rechazo digital en rad
Ap=1;%riple de pasabanda en dB
As=30;%atenuacion en dB
%especificaciones de prototipo analogico
T = 0.1; %poner T=1
Omegap = (2/T)*tan(wp/2); %frecuencia de pasabanda del prototipo
Omegas = (2/T)*tan(ws/2);%frecuencia de rechazabanda del prototipo
%hallamos parametros del filtro
[N,Omegac] = cheb1ord(Omegap,Omegas,Ap,As,'s'); N
[C,D] = cheby1(N,Ap,Omegac,'s'); [B,A] = bilinear(C,D,1/T);
%reresentacion espectral
w=linspace(0,pi,1000);
H=freqz(B,A,w);
subplot(211);plot(w/pi,abs(H));grid on;
subplot(212);plot(w/pi,angle(H));grid on;
figure
freqz(B,A)