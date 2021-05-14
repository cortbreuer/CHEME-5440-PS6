q1 = 1.602*10^-19; %C
q2 = 2*1.602*10^-19; %C
E = 10000; %V/m ie 100 V/cm
n = 10^-3; %kg/m*s
R = 2*10^-9; %m ie 2 nm

v1 = (q1*E)/(6*pi*n*R);
v2 = (q2*E)/(6*pi*n*R);

dx = .001; %m ie 1 mm
dv = v2-v1;

dt = dx / dv;0