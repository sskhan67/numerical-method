function [t,y] = driver_khan(tstop,dt,y0,k)
close all
% driver function to solve multiple nonlinear functions using euler implicit
% Written by: Syeduzzaman Khan
% input: tstop= run time in seconds
% dt=step size
% y: nuermical solution 
% sample: driver_khan(5,0.1,[1 0 0],[1 10000 10])

u(1)=k(1);
u(2)=k(2);
u(3)=k(3);
[t,y]=euler_implicit_linear_khan(@fun,@jacob,tstop,dt,y0,u);
figure()
plot(t,y(:,1),'-.r*','DisplayName','Y1');
hold on
plot(t,10*y(:,2),'-mo','DisplayName','Y2');
plot(t,y(:,3),':bs','DisplayName','Y3');
legend
end

