function [t,y] = euler_implicit_linear_khan(fun,jacob,tstop,dt,y0,u)
nsteps=round(tstop/dt)+1;
npar=length(y0);
y=zeros(nsteps,npar);
t=zeros(nsteps,1);
y(1,:)=y0;
t(1)=0;
atol=1e-8;
rtol=1e-4;
for i=1:nsteps-1
    fofy=fun(t(i),y(i,:),u);
    yi=y(i,:)';
    Xj=yi+fofy'*dt; 
    t(i+1)=t(i)+dt;
  % netwon iteration
  for j=1:10
      dfdy=jacob(t(i+1),Xj,u);
      Z=eye(3)*(1/dt)-dfdy;
      fofy=fun(t(i+1),Xj,u );
      Fj=(Xj-yi)/dt-fofy';
      b=-Fj+Z*Xj;
      Xjp1=Z\b;
      % check change     
      delta=abs(Xjp1-Xj)./(Xj+atol);
      delnorm=sqrt(sum(delta.*delta));
      if delnorm<rtol
       y(i+1,:)=(Xjp1)';
          break
      else
          Xj=Xjp1;
      end
      if j>=10
          disp('Newton iteration failed')
          return 
      end
      
end
    
end
end

