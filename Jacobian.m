J1 = zeros(2,2);
J2 = zeros(2,2);
a = 10;
n1 = 1;
n2 = 2;

sState_n1 = 2.7;
sState_n2 = 2;

J1(1,1) = -1;
J1(2,2) = -1;
J1(1,2) = -(a*n1*sState_n1^(n1-1)) / (sState_n1^n1 + 1)^2;
J1(2,1) = -(a*n1*sState_n1^(n1-1)) / (sState_n1^n1 + 1)^2;

J2(1,1) = -1;
J2(2,2) = -1;
J2(1,2) = -(a*n2*sState_n2^(n2-1)) / (sState_n2^n2 + 1)^2;
J2(2,1) = -(a*n2*sState_n2^(n2-1)) / (sState_n2^n2 + 1)^2;

eig(J1)
eig(J2)

det(J1)
det(J2)

TrJ1 = J1(1,1) + J1(2,2)
TrJ2 = J2(1,1) + J2(2,2)