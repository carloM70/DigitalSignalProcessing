clear all
close all
clc
T=.1;f=9;
nn=0:.0001:1;
xc=cos(2*pi*f*nn);
n=(0:T:1)';
xs=cos(2*pi*f*n);
t=linspace(0,1,1/.0001)';
ya=sinc((1/T)*t(:,ones(size(n)))-(1/T)*n(:,ones(size(t)))')*xs;
plot(n,xs,'or',t,ya,'b',nn,xc,'.-b');grid on;