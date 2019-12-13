function [ydot] = fofy(t,y,u)
ydot=u(1)*y;
%ydot=-u(1)*(y-(t*t+1))+2*t;

end

