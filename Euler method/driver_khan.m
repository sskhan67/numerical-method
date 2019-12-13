function [t,y] = driver_khan(tstop,dt,y0,k)
close all
u(1)=k;
[t,y]=ode_khan(@fofy,tstop,dt,y0,u);

% yexact=y0*exp(k*t);
% %yexact=(y0-1).*exp(-k.*t)+t.*t+1;
% 
% figure()
% plot(t,(y),'o-','DisplayName','Numerical');
% hold on
% plot(t,(yexact),'r','DisplayName','Analytical')
% xlabel('Time (s)')
% ylabel('y(t)')
% legend

% figure()
% semilogy(t,yexact,'r','DisplayName','Analytical')
% hold on
% semilogy(t,y,'o-','DisplayName','Numerical')
% 
% xlabel('Time (s)')
% ylabel('y(t)')
% legend
end

