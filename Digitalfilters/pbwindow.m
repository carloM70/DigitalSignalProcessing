clear all
close all
clc
wp1=0.2*pi;ws1=0.35*pi;ws2=0.65*pi;wp2=0.8*pi;Ap=0.1;As=60;
deltaw1=ws1-wp1;wc1=(wp1+ws1)/2;
deltaw2=wp2-ws2;wc2=(wp2+ws2)/2;
deltaw=min(deltaw1,deltaw2);
L=ceil(11*pi/deltaw)+1;M=L-1;
hd=ideallp_2(pi,M)-ideallp_2(wc2,M)+ideallp_2(wc1,M);
win=blackman(L);
h=hd.*win';
freqz(h)