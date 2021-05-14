% CHEME 5440
% PS06
% Problem 3

%% This calculates the glycocalyx compressibility coefficient 
%  

clear all;
close all;

A1 = 2*10^-6; %cm2
A2 = 2*10^-6; %cm2
Amax = 10^-6; %cm2
N1t = 10^5; %1/cell
N2t = 10^5; %1/cell
%gamma = 10^-6; %dyn
tau = 10^-6; %cm
KL = 10^-8; %cm2
L = 2*10^-6; %cm2
kappa = 0.1; %dyn/cm
kb = 1.3807*10^-16; %erg/K
T = 37+273; %K


%Equations
%S = 0.5*(L+(kb*T/(kappa*tau))+sqrt((L+kb*T/(kappa*tau))^2+4*kb*T/kappa));
S =2.43*10^-6;
K = KL*exp(-0.5*kappa*(S-L)^2/(kb*T));

%Gamma = N1t^2 / ((A1^2/(kb*T*K)) + ((2*N1t*Amax)/(kb*T)) - (Amax/(kb*T)));

b = - (A1^2 / (kb * T * K)) - ((2 * N1t*Amax)/(kb*T));
a = (Amax / (kb*T))^2;
c = N1t^2;

GammaPlus = (-b + sqrt(b^2 - (4 * a * c))) / (2*a);
GammaMinus = (-b - sqrt(b^2 - (4 * a * c))) / (2*a);

%Gamma = N2t*kb*T/((A1*A2/K*N1t)+Amax);
gammaPlus = GammaPlus*S/(exp(-S/tau));
gammaMinus = GammaMinus*S/(exp(-S/tau));

%xi = A1*A2*Gamma/(kb*T*K);
% Nb = 0.5*(N1t+N2t-sqrt((N1t-N2t)^2+4*xi));
% Ac = (kb*T*Nb/Gamma);
%disp(gamma)