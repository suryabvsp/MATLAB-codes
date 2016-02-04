close all;
clear all;
clc;
%n = 0:1:9;
T = pi;
N = 256;
Ts = T/N;
%a = linspace(0,0,10);
a=zeros(1,10);
for k = 1:1:10
for n = 0:1:N-1
a(k) = a(k) + (1/N)*exp(-n*Ts/2)*exp(-j*(k-1)*2*Ts*n);
end
end
figure(1)
stem(1:10,abs(a))
xlabel('k');
ylabel('|a_k|');
title('Magnitude spectra, 14UEC109');
figure(2)
stem(1:10,angle(a))
xlabel('k');
ylabel('\angle a_k');
title('Phase spectra, 14UEC109');
A = [abs(a)',angle(a)'];
disp('Amplitude angle')
disp(A)