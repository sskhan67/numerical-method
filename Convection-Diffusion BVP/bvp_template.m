function [x, v] = bvp_template (npts, R )
% function [x, v] = bvp_template (npts, R )
%   template for direct solution of bvp by tridiagonal matrix inversion
%   v = solution array on grid
%   x = grid point locations

% parameters
u(1) = R ;
%%% note: this 'u' vector is the parameter vector, as the name was used for
%%% ODE solvers in previous projects.  

% mesh (grid)
dx = 1/(npts-1) ;
x = 0: dx: 1 ;

% call bvp solver
v = bvp_khan (@mat_khan, x, u ) ;

% post-proces: plot numerical and exact solutions

V_exact=(exp(R.*x)-1)/(exp(R)-1);

figure()
plot(x,(v),'o-','DisplayName','Numerical','LineWidth',2);
hold on
plot(x,(V_exact),'r','DisplayName','Analytical','LineWidth',2)
xlabel('Time (s)')
ylabel('y(t)')
legend
grid on

end

