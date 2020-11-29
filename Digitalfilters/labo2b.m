clear all
close all
clc
wn=1;
epsilon=0.5;
Ts=pi/10;nf=round(12/Ts);
G=tf([wn*wn],[1 2*epsilon*wn wn*wn]);
Gd=c2d(G,Ts);x_1=[1 zeros(1,50)];x_2=ones(1,nf);
y=lsim(Gd,x_2);
for i=1:length(y)-1
    z(i)=y(i+1)-y(i);
end
%4)
n=1:nf-1;a=0.9;
x_3=a.^n;
y_1=filter(z,1,x_3);%conv(x_3,z);
subplot(3,1,1);step(G);ylim([0 1.5]);grid on
subplot(3,1,2);stem(y);xlim([0 nf]);grid on
subplot(3,1,3);stem(z);xlim([0 nf]);grid on
figure
subplot(3,1,1);stem(n,x_3);grid on
subplot(3,1,2);stem(n,z);grid on
subplot(3,1,3);stem(n,y_1(1:nf-1));grid on
