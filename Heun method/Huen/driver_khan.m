function [t,y,t90] = driver_khan(tstop,dt,y0,k)
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
plot(t,y(:,1),'-.r*','DisplayName','Numerical');
hold on
plot(t,y(:,2),'--mo','DisplayName','Numerical');
plot(t,y(:,3),':bs','DisplayName','Numerical');

plot(t1,(yexact1),'b','DisplayName','Analytical')
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

y90=0.90;
for i=1:length(t)
    if y(i,3)>=0.9
        t90=t(i-1)+(t(i)-t(i-1))* (0.90-y(i-1,3))/(y(i,3)-y(i-1,3));
        break
    end
    
end
end

