
% for ODE2 Implict method 
function [t,y] = euler_ode2_khan(tstop,dt,y0,u)
nsteps=round(tstop/dt)+1;
y=zeros(nsteps,1);
t=zeros(nsteps,1);
y(1)=y0;
t(1)=0;
for i=1:nsteps-1
    y(i+1)=y(i)/(1-u(1)*dt); % specific to ODE1 only!!!
    t(i+1)=t(i)+dt;
end
end

