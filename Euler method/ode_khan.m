function [t,y] = ode_khan(fcn_name,tstop,dt,y0,u)
nsteps=round(tstop/dt)+1;
y=zeros(nsteps,1);
t=zeros(nsteps,1);
y(1)=y0;
t(1)=0;
for i=1:nsteps-1
    ydot=fcn_name(t(i),y(i),u);
    y(i+1)=y(i)+ydot*dt;% euler function
    t(i+1)=t(i)+dt;
end
end

