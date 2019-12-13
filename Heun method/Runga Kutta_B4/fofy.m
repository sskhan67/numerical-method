function [ydot] = fofy(t,y,u)

ydot=-u(1)*(y-(t*t+1))+2*t;
% ydot(1)=-u(1)*y(1);
% 
% ydot(2)=u(1)*y(1)-u(2)*y(2);
% 
% ydot(3)=u(2)*y(2);



end

