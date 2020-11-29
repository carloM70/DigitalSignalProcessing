clear all
close all
clc
ws=0.25*pi;wp=0.35*pi;Ap=0.1;As=50;
deltap=(1-10^(Ap/20))/(1+10^(Ap/20));
deltas=(1+deltap)/(10^(As/20));
delta=min(deltap,deltas);
deltaw=wp-ws;wc=(wp+ws)/2;
L=ceil(6.6*pi/deltaw)+1;M=L-1;
hd=ideallp_2(pi,M)-ideallp_2(wc,M);
win=hamming(L);
h=hd.*win';
nfft=1024;Fs=1000;
H1=fft(h,nfft);H1=H1(1:nfft/2);
frec=(0:nfft/2-1)*Fs/nfft;
%w=linspace(0,pi,1000);
%H1=freqz(h,1,w);
subplot(211);plot(2*frec/Fs,abs(H1));
subplot(212);plot(frec,unwrap(angle(H1)));
