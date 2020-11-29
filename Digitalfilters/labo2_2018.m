clear all
close all
clc
%transformada z de la entrada
b=[1 -4];a=[1 -3 2];
%identificar polos, residuos 
[R,p,C]=residuez(b,a);
%creamos las secuencias
n=-5:5;
%1
x_1=2*(2.^n)-3;u_1=[ones(1,5) zeros(1,6)];
x_1=x_1.*u_1;
%2
x_2=3-2*(2.^n);u_2=[zeros(1,5) ones(1,6)];
x_2=x_2.*u_2;
%3
x_3=(2*(2.^n).*[ones(1,5) zeros(1,6)])+(3.*[zeros(1,5) ones(1,6)]);
%graficando las señales
figure(1)
subplot(311);stem(n,x_1);xlabel('muestras');ylabel('primera solucion, señal x_1');grid on;
subplot(312);stem(n,x_2);xlabel('muestras');ylabel('segunda solucion, señal x_2');grid on;
subplot(313);stem(n,x_3);xlabel('muestras');ylabel('tercera solucion, señal x_3');grid on;
%introduciendo polos y ceros para el filtro
z_1=[1 0.8];
z_2=[1 0.5];
z_3=[1 -1.5*exp(pi*i/4)];z_4=[1 -1.5*exp(-pi*i/4)];
%generando
h_1=conv(z_3,z_4);h_2=conv(z_1,z_2);
%graficando polos y ceros
figure(2)
title('polos y ceros del filtro')
zplane(h_1,h_2)
%realizando el filtrado
y_1=filter(h_1,h_2,x_1);
y_2=filter(h_1,h_2,x_2);
y_3=filter(h_1,h_2,x_3);
%graficando las salidas
figure(3)
title('respuestas al filtro')
subplot(311);stem(n,y_1);xlabel('muestras');ylabel('salida y_1');grid on;
subplot(312);stem(n,y_2);xlabel('muestras');ylabel('salida y_2');grid on;
subplot(313);stem(n,y_3);xlabel('muestras');ylabel('salida y_3');grid on;