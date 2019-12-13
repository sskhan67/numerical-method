function [t,y] = euler_implicit_linear_khan(tstop,dt,y0,A)
% euler implicit method to solve linear equations, eng 219
% function returns nuermical solution using euler implicit method 
nsteps=round(tstop/dt)+1;
npar=length(y0);
y=zeros(nsteps,npar);
t=zeros(nsteps,1);
y(1,:)=y0;
t(1)=0;

for i=1:nsteps-1
    M=eye(npar)-A*dt;
    b=(y(i,:))';
    x=M\b; 
    y(i+1,:)=(x)';  
    t(i+1)=t(i)+dt;    
end
end

