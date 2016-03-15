%Write a simple MATLAB program to perform the CCF. Use your routine to plot
%the crosscorrelation of given signal
close all; %close open figures and windows generated by running MATLAB code
clear all; %clear the workspace
clc;       %clear the command window

f = 1;          %Frequency of given signal x(t)
Fs = 200;       %Sampling Frequency
N = 1024;       %Total no. of samples
m=1:1:N+1;       %Sampling index
n=1:1:N-m+1;     %represets time for discrete sampled function


%For two wide sense stationary (WSS) processes x(t) and y(t),
w = randn(1,N);   %A zero-mean,unit variance of the Gaussian random process
x = sin(2*pi*f*n/Fs);%One of the given functions the CCF is being found for
y = x + w;           %The other of the given functions whose CCF is needed

R=zeros(N+1);        %Initialising the CCF matrix

%Finding Cross Correlation Function
for m=1:1:N+1               %Loop running over sampling index m
    for n=1:1:N-m+1         %Loop for summation for a fixed discrete time n
       R(m)=R(m)+(x(n)*y(n+m-1))/N; %Sampled Cross correlation function
    end;
end;

%Plotting samples of CCF vs. sampling index m
m=1:1:N+1;          %Sampling index
figure              %Will open a new figure
plot(m,R);          %Plot R vs m
xlabel('m');        %X axis represents m, the sampling index
ylabel('R');        %Y axis represents R, the sampled CCF
title('Cross Correlation Function, 14UEC109');  %Title of the plot
