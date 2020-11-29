clear all
close all
clc
wn=1;
epsilon=0.5;
Ts=pi/10;
G=tf([wn*wn],[1 2*epsilon*wn wn*wn]);
Gd=c2d(G,Ts);
[nd,dd]=tfdata(Gd,'v');b=[0 nd];a=[dd];
x_1=ones(1,50);x_2=[1 zeros(1,49)];
y=filter(b,a,x_1);y_1=filter(b,a,x_2);
z(1)=0;
for i=2:length(y)
    z(i)=y(i)-y(i-1);
end    
subplot(4,1,1);step(G);grid on
subplot(4,1,2);stem(y);grid on
subplot(4,1,3);stem(z);grid on
subplot(4,1,4);stem(y_1);grid on