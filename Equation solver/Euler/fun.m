function [ydot] = fun(t,y,u)
ydot(1)=-u(1)*y(1)+u(3)*y(2)*y(3);
ydot(2)=u(1)*y(1)-u(2)*y(2)*y(2)- u(3)*y(2)*y(3);
ydot(3)=u(2)*y(2)*y(2);
end

