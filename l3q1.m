%Question 1: TO COMPUTE FOURIER TRANSFORM OF x_1(t) = exp(-2t)u(t) and plot the magnitude and phase spectra

close all;  %close all open windows generated previously
clc;        %clear the command window
clear all;  %clear the variables

T0 = 4;       %Time period of signal
Ts = 1/64;    %Sampling interval
N = T0/Ts;    %Total number of samples
w0 = 2*pi/T0; %Frequency of signal


X = zeros(256,1);%Rth sample of frequency domain representation of signal
for r = 1:1:256  %taking 256 samples
    for k = 0:1:N-1%k is the index of summation from k equals 0 to N-1
        %For the rth sample of the fourier transform, X_r=X(rw0):
        X(r) = X(r) + Ts*exp(-2*k*Ts)*1*exp(-j*(r-1)*w0*k*Ts);
    end;
end;

r = 1:1:256;     %r is the index for 256 samples of Xr
w = r.*w0;       %Frequency varies with r
t = 0:0.1:10;    %Time array

x1 = exp(-2.*t)*1;     %Time domain aperiodic signal x1(t).u(t)=1 for all t.

figure(1)                            %Figure for the magnitude sectrum
stem(w,abs(X))                       %Discrete plot for |X(w)| vs w
xlabel('w')                          %Label for X-Axis of the plot
ylabel('|X|')                        %Label for Y-Axis of the plot
title('14UEC109, Question 1: Magnitude spectra') %Title for plot

figure(2)                            %Figure for the phase sectrum
stem(w,angle(X))                     %Discrete plot for phase of X(rw0)vs w
xlabel('w')                          %Label for X-Axis of the plot
ylabel('\angle X')                   %Label for Y-Axis of the plot
title('14UEC109, Question 1: Phase spectra')     %Title for plot

figure(3)                            %Figure for the phase sectrum
plot(t,x1)                           %Continuous plot for time domain signal x1(t)
xlabel('t')                          %Label for X-Axis of the plot
ylabel('x_1(t)')                     %Label for Y-Axis of the plot
title('14UEC109, Time domain signal')%Title for plot
