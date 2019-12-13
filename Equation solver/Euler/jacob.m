function dfdy = jacob(t,y,u)
  dfdy=[-u(1) u(3)*y(3) u(3)*y(2); u(1) -2*u(2)*y(2)-u(3)*y(3) -u(3)*y(2);0 2*u(2)*y(2) 0];
 
end

