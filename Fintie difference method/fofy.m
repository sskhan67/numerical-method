function [ydot] = fofy(t,y,u)

% parameters
npts=u(1);
dx=u(2);
visc=u(3);
visc_num=u(4);

coef=visc_num/dx^2;

% BC 
g=exp(-t/(4*visc));

ydot(npts)=0; % set vector size

ydot(1)= g/(4*visc)/((1+g)^2);


% % function loop using central difference 
for j=2:npts-1
    ydot(j)= - y(j) *   ( y(j+1)- y(j-1) )/ (2*dx) + coef* ( y(j+1)- 2*y(j)+y(j-1) ) ;
end


% % % using upwind difference 
% % % 
%  for j=2:npts-1
%      vave=( y(j)+y(j-1) )/2;
%      
%      ydot(j)= -vave * ( y(j)-y(j-1))/dx + coef* (y(j+1)-2*y(j)+y(j-1))  ;
%  end


end

