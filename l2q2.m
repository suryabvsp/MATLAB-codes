close all;
clear all;
clc;
w0=2;
T = pi;
N = 256;
Ts = T/N;
t = 0:Ts:(N-1)*Ts;
y = exp(-t/2);
a=zeros(1,101);
for k = 1:1:101
for n = 0:1:N-1
a(k) = a(k) + (1/N)*exp(-n*Ts/2)*exp(-j*(k-1)*2*Ts*n);
end
end
M = [2 9 19 100];
x = zeros(256,4);
for n = 0:1:N-1
for i = 1:1:4
for k = 1:1:M(i)
x(n+1,i) = x(n+1,i) + (a(k+1))*exp(j*k*w0*n*Ts)+ (conj(-
a(k+1)))*exp(j*k*w0*n*Ts);
end
x(n+1,i) = x(n+1,i) + a(1);
end
end
t = 0:Ts:(N-1)*Ts;
plot(t,y);
hold on;
plot(t,(x(:,1)))
hold on;
plot(t,(x(:,2)))
hold on;
plot(t,(x(:,3)))
hold on;
plot(t,(x(:,4)))
hold on;
legend('x(t)','x_2(t)','x_9(t)','x_{19}(t)','x_{100}(t)')
xlabel('t');
ylabel('signal');
title('x_M(t) for M=2,9,19,100. 14UEC109');