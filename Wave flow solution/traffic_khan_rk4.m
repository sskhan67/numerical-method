function [ t, y ] = traffic_khan_rk4 (tstop, dt, ntimpl, npts, dist, fract, peak)
% function [ t, y ] = traffic_blank_rk4 (tstop, dt, ntimpl, npts, dist, fract, peak )
%   Driver routine for ODE integration using Runge-Kutta 4th order method
%   Input:
%   tstop = final time (hr)
%   dt = time step  (hr)
%   ntimpl = increment in time for curves
%   dist = distance for the domain (miles)
%   fract = fraction of maximum density for the initial density
%   peak = fraction of maximum density for IC
%   Output:
%   t = vector of solution times
%   y = matrix of solutions


% parameters
cmax = 70 ; % max speed (km/hr)
rmax = 250 ;  % jammed density (cars/km)
dx = dist / ( npts - 1 ) ;
xgrd = 0 : dx : dist ;

u(1) = cmax ;
u(2) = rmax ;
u(3) = dx ;
u(4) = npts ;

% define IC
yo = ones(npts,1) * rmax * fract  ;
for j = 1 : npts
   theta = 2*pi *xgrd(j) /dist ;
   yo(j) = yo(j)*( 1 + peak*sin( theta )  ) ;
end

% plot IC
figure(1)
addcurv (yo, xgrd, cmax, rmax, 0)

[t, y] = rk4_AL (@yofx, tstop, dt, yo, u ) ;


ntim = length(t) ;
for n = 1 : ntimpl : ntim 
    ypl = y(n,:) ;
    addcurv (ypl, xgrd, cmax, rmax, t(n) )
    pause %(0.25) 
end

end

function addcurv (y, x, cmax, rmax, tim)

subplot(3,1,1)
plot(x, y, '.')
ylabel('Density (car/mile)')
str = [ 't (hr) = ', num2str(tim)] ;
title( str ) 

subplot(3,1,2)
qpl = car_eos( cmax, rmax, y ) ;
plot(x, qpl, '.')
ylabel('Flow (car/hr)')

subplot(3,1,3)
vpl = qpl ./ y ;
plot( x, vpl, '.' );
ylabel('Velocity (mph)')
xlabel('Distance (miles)')   

end


function ydot = yofx(~, y, u)
% function to return right-side of ode's

cmax = u(1) ;
rmax = u(2) ;
dx = u(3) ;
n = u(4) ;

% fill the flow rate vector 
q = car_eos (cmax, rmax, y) ;

ydot(1,n) = 0 ;

% periodic BC at left
ydot(1)=-(q(2)-q(n)) / (2*dx);

for j = 2 : n-1

    % use windward difference on flux
    %%% ydot(j)=-( y(j) - y(j-1) )/dx;
    %%% check equation; the space difference is on the flux (q), not the
    %%% density, which is what is stored in the y-vector.  Notice that the
    %%% flux (q) comes from the car_eos routine provided; this evaluates
    %%% the parabola shown in the handout.
    ydot(j)=-( q(j) - q(j-1) )/dx;
    
end

% periodic BC at right

ydot(n)=    -(q(1)- q(n-1) )/(2*dx);
end

function q = car_eos ( cm, rm, r )
% eqn-of-state relation between density and velocity in traffic

qm = cm * rm / 4 ; 
q = qm.* ( 1 - 4*( r/rm - 1/2 ).^2 ) ;

end

function [t, y] = rk4_AL (fcn_name, tstop, dt, yo, u)


% steps
nsteps = round(tstop/dt) + 1 ;
dthalf = dt/2 ;

% dimensions
npar = length(yo) ; 
y = zeros(nsteps,npar) ;
t = zeros(nsteps,1) ;

%  initial conditions

y(1,:) = yo ;
t(1) = 0. ;

for i = 1:nsteps-1 
       
    ti = t(i) ;
    yi = y(i,:) ;
    k1 = fcn_name( ti, yi, u) ;
    
    t2 = ti + dthalf ;
    y2 = yi + k1 * dthalf ;
    k2 = fcn_name( t2, y2, u) ;
    
    y3 = yi + k2 *dthalf ;
    k3 = fcn_name( t2, y3, u) ;

    y4 = yi + k3 *dt ;
    t(i+1) = t(i) + dt ;
    k4 = fcn_name( t(i), y4, u) ;    
    
    y(i+1,:) = y(i,:) + ( k1 + 2*k2 + 2*k3 + k4 )*dt/6 ;
end

end