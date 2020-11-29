clear all
close all
clc
%PARAMETROS
fs = 11025;
fpb = 1800;
fsb = 2300;
Rp = .1;
Rs = .1;
T = 1/fs;
%especificaciones de filtro digital 
wp=(fpb/fs)*2*pi%frecuencia de banda de paso digital en rad
ws=(fsb/fs)*2*pi%frecuencia de banda de rechazo digital en rad
RpdB = -20*log10(1-Rp)
RsdB = -20*log10(Rs)

%especificaciones de filtro digital 
wp=0.2*pi;%frecuencia de banda de paso digital en rad
ws=0.3*pi;%frecuencia de banda de rechazo digital en rad
Ap=1;%riple de pasabanda en dB
As=15;%atenuacion en dB
%especificaciones de prototipo analogico
T=1;Fs=1/T;%poner T=1
OmegaP=(2/T)*tan(wp/2);%frecuencia de pasabanda del prototipo
OmegaS=(2/T)*tan(ws/2);%frecuencia de rechazabanda del prototipo
%hallamos parametros del filtro
[N,OmegaC]=buttord(OmegaP,OmegaS,Ap,As,'s');
[C,D]=butter(N,OmegaC,'s');
[b,a]=bilinear(C,D,Fs);
%reresentacion espectral
w=linspace(0,pi,1000);
H=freqz(b,a,w);
subplot(211);plot(w/pi,abs(H));grid on;
subplot(212);plot(w/pi,angle(H));grid on;
figure
freqz(b,a)
zplane(roots(b),roots(a))
