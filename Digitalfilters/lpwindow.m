clear all
close all
clc
wp=0.25*pi;ws=0.35*pi;Ap=0.1;As=50;
deltap=(10^(Ap/20)-1)/(1+10^(Ap/20));
deltas=(1+deltap)/(10^(As/20));
delta=min(deltap,deltas);
deltaw=ws-wp;wc=(wp+ws)/2;
L=ceil(6.6*pi/deltaw)+1;M=L-1;
hd=ideallp_2(wc,M);
win=hamming(L);
h=hd.*win';
freqz(h)
