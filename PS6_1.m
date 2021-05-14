% CHEME 5440
% PS06
% Problem 1

%% This simulates the genetic toggle switch
%  

clear all;
close all;

%Species
% x(1) = R1
% x(2) = R2

% Initial conditions
% x0(1) = 0.1;     % R1 repressor (nM)
% x0(2) = 2.5;     % R2 repressor (nM)
 
%Parameters
a = 10;
n = 2;

% Time-span
%tspan = [0 50] ; % time-span in min

% Use ODE45 solver
%[t_out,x_out] = ode45(@(t,x) PS6_ODE1(t,x,a,n),tspan,x0);

%Calculate phase vectors
size_test = 40;
R1_test = linspace(0,12,size_test);
R2_test = linspace(0,12,size_test);

for i = 1:size_test
    for j = 1:size_test
        dR1(j,i) = a/(1+(R2_test(j)^n))-R1_test(i);
        dR2(j,i) = a/(1+(R1_test(i)^n))-R2_test(j);
    end
end

%Calculate nullclines
R1_null = zeros(size_test,1);
R2_null = zeros(size_test,1);

for i = 1:size_test
    R1_null(i) = a/(1+(R2_test(i)^n));
    R2_null(i) = a/(1+(R1_test(i)^n));
end

% Plot results in nM values
figure(1);
quiver(R1_test,R2_test,dR1,dR2,1.5,'k')
hold on;
plot(R1_test,R2_null,'-m'); % plot time in minutes
plot(R1_null,R2_test,'-b'); % plot time in minutes
legend('Phase Vectors','R2 nullcline','R1 nullcline','Location','Best');

set(gcf,'Position', [548 171 423 334]);
set(gcf,'Color', [1 1 1]);
set(gca,'FontName','Arial');
set(gca,'FontSize',14);
set(gca,'XGrid','off');
set(gca,'YGrid','off');
xlim([0 12])
ylim([0 12])
xlabel('R1 Concentration','FontName','Arial','FontSize',14);
ylabel('R2 Concentration','FontName','Arial','FontSize',14);
str = sprintf('Alpha = %1.1f n = %1.1f', a, n);
title(str)

set(gca,'GridLineStyle','--');
set(gca,'TickDir','out');
box on;
grid on;
hold off;
