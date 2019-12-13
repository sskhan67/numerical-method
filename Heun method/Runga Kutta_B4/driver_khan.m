%[t,y] = driver_khan(2,0.2,3,[10 0])

function [t,y] = driver_khan(tstop,dt,y0,k)
close all
u(1)=k(1);
u(2)=k(2);
%y0(1) = 1;

%[t,y]=ode_khan(@fofy,tstop,dt,y0,u);
[t,y]=ode_khan_rk(@fofy,tstop,dt,y0,u);

%for i=1:0.005:dt
t1=0:.0001:tstop; 

yexact=(y0-1).*exp(-k(1).*t1)+t1.*t1+1;

figure()
plot(t,(y),'o-','DisplayName','Numerical');
hold on
plot(t1,(yexact),'r','DisplayName','Analytical')
xlabel('Time (s)')
ylabel('y(t)')
legend



end

