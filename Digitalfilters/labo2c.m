w0=0.1*pi;A=2;
y(1)=0;y(2)=-A*sin(w0);
for i=1:50
    y(i+2)=2*cos(w0)*y(i+1)-y(i);
    y_1(i)=A*sin((i+1)*w0);
end
subplot(211);stem(y);grid on
subplot(212);stem(y_1(2:length(y_1)));grid on

