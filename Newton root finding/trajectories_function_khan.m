function [ftheta] = trajectories_function_khan(theta)
% [fx] = trajectories_function_khan(theta) evaluates trajectories 
% input: theta angle in degree
% output: [fx]=returns functions   
%Parameters: v_0=velocity in m/s, x=distance in m, y_0= intial diatcne in
%m, y= distance to ball in m, g= gravitational acceleration in m/s^2

v_0=20;
x=40;
y_0=1.8;
y=1;
g=9.8;
theta=pi/180*theta;


ftheta=(tan(theta).*x)-((g.*x.^2)./(2.*v_0.^2*cos(theta).^2))+(y_0-y);


end

