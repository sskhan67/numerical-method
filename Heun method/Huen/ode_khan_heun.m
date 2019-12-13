function [t,y] = ode_khan_heun(fcn_name,tstop,dt,y0,u)
nsteps=round(tstop/dt)+1;
npar=length(y0);
y=zeros(nsteps,npar);
t=zeros(nsteps,1);
y(1,:)=y0;
t(1)=0;
for i=1:nsteps-1
    
    k1=fcn_name(t(i),y(i,:),u);
    ypred=y(i,:)+k1*dt;
    t(i+1)=t(i)+dt;
    k2=fcn_name(t(i+1),ypred,u);
    phi=(k1+k2)/2;
    y(i+1,:)=y(i,:)+phi*dt;% heun method 
end
end

