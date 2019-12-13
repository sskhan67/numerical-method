function [t,y] = driver_khan(tstop,dt,y0)
close all
% driver function to solve multiple linear functions using euler implicit
% Written by: Syeduzzaman Khan
% input: tstop= run time in seconds
% dt=step size
% y: nuermical solution 
% sample: sine_khan(60,4)
A=[-5 3; 100 -301];
[t,y]=euler_implicit_linear_khan(tstop,dt,y0,A);
% analytical solution 
t1=0:dt:tstop;    
yexact=52.96*exp(-3.9899.*t)-0.67*exp(-302.0101.*t);

figure()
plot(t,y(:,1),'-.r*','DisplayName','Numerical');
hold on
plot(t1,yexact,'DisplayName','Analytical');
grid on
legend
end

