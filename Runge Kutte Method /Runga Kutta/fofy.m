function [ydot] = fofy(t,y,u)
a=u(1);
b=u(2);
c=u(3);
d=u(4);

xy=y(1)*y(2);

ydot(1)=a*y(1)-b*xy;

ydot(2)=-c*y(2)+d*xy;



end

