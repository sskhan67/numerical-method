function [t,y] = ode_khan_rk(fcn_name,tstop,dt,y0,u)
nsteps=round(tstop/dt)+1;

npar=length(y0);
y=zeros(nsteps,npar);
t=zeros(nsteps,1);
y(1,:)=y0;
t(1)=0;

for i=1:nsteps-1
    
    k1=fcn_name(t(i),y(i,:),u);
    
    k2=fcn_name(t(i)+dt/2,y(i,:)+k1*dt/2,u);
    
    k3=fcn_name(t(i)+dt/2,y(i,:)+k2*dt/2,u);
    
    k4=fcn_name(t(i)+dt,y(i,:)+k3*dt,u);

    
    
    
    t(i+1)=t(i)+dt;
    phi=(k1+2*k2+2*k3+k4)/6;
    
    y(i+1,:)=y(i,:)+phi*dt; 
end
end

