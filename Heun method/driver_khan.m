function [t,y] = driver_khan(tstop,dt,y0,k)
close all
u(1)=k(1);
u(2)=k(2);
%y0(1) = 1;

%[t,y]=ode_khan(@fofy,tstop,dt,y0,u);
[t,y]=ode_khan_heun(@fofy,tstop,dt,y0,u);

%for i=1:0.005:dt
t1=0:.0001:tstop;    
yexact1=y0(1).*exp(-k(1).*t1);

figure()
plot(t,(y),'o-','DisplayName','Numerical');
hold on
plot(t1,(yexact1),'r','DisplayName','Analytical')
xlabel('Time (s)')
ylabel('y(t)')
legend


yexact2=y0(1)*(k(1)/(k(1)-k(2)))*(exp(-k(2)*t1)-exp(-k(1)*t1));


plot(t1,(yexact2),'DisplayName','Analytical')
xlabel('Time (s)')
ylabel('y(t)')
legend

yexact3=y0(1)*(1-(k(1)/(k(1)-k(2)))*exp(-k(2)*t1) + (k(2)/(k(1)-k(2)))*exp(-k(1)*t1));


plot(t1,(yexact3),'DisplayName','Analytical')
xlabel('Time (s)')
ylabel('y(t)')
legend

title('Huen method: K1=3, K2=10, step size=0.1s')
end

