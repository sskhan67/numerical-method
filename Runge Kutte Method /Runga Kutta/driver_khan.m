function [t,y] = driver_khan(tstop,dt,y0,k)
close all
u(1)=k(1);
u(2)=k(2);
u(3)=k(3);
u(4)=k(4);


[t,y]=ode_khan_rk(@fofy,tstop,dt,y0,u);

figure()
%plot(t,(y),'o-','DisplayName','Numerical');
plot(t,y(:,1),t,y(:,2),'LineWidth',3);

xlabel('t')
legend({'x, Prey','y, Predator'},'Location','southwest')

title('Time-domain representation of numbers of prey and predators for the Lotka-Volterra model.')

figure()
plot(y(:,1),y(:,2),'LineWidth',3)
xlabel('x')
ylabel('y')
title('Phase-plane representation for the Lotka-Volterra model.')
end

