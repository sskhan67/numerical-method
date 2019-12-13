function [t,y] = driver_khan(tstop,dt,y0,k)
close all
u(1)=k;
[t,y]=ode_khan(tstop,dt,y0,u);

t1=0:0.001:tstop;
yexact=y0*exp(k*t1);
%yexact=(y0-1).*exp(-k.*t)+t.*t+1;

figure()
plot(t,(y),'o-','DisplayName','Numerical','LineWidth',2);
hold on
plot(t1,(yexact),'r','DisplayName','Analytical','LineWidth',2)
xlabel('Time (s)')
ylabel('y(t)')
legend
grid on

end

