function [t,y,yexact] = driver_khan(tstop,dt,npts,x1,visc,vis_num, nskip)
% u=[dx npts v]
clc
close all
clc

 % Parameters 

dx=x1/(npts-1);

x=0:dx:x1;


%IC

y0=1./( 1+ exp(x./2/visc) );


% u vector 

u=[npts,dx,visc,vis_num]

% FUNCTION CALL 
[t,y]=ode_khan_rk(@fofy,tstop,dt,y0,u);


% Plot 
nsteps=round(tstop/dt)+1;  


for i=1:nskip:nsteps  
    for j=1:npts
        
      yexact(j)=1  /  (  1+ exp( (x(j)/(2*visc) ) -(t(i)/(4*visc)) ) ); 

      
        
    end
    
        
        plot(x,yexact,'DisplayName','Analytical',x,y(i,:),'o-','DisplayName','Numerical');
        xlabel('x')
        ylabel('V')
        legend

        %pause
        %plot(x,y(i,:));
        hold on

end


end

