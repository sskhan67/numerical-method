function y = graph_sine_khan(theta_max,n)
% function to plot sine function from 0 to max_angles
% Syeduzzaman Khan
% input: theta= angle in degrees
% n=number of temrs 
% output: 1. y=sine value (dimensionless) from Taylor series
         %2. y=sin value from Matlab's sine function   
% sample: graph_sine_khan(180,1)

npts=50; % smapline points 
del_theta=theta_max/(npts-1); % step size 
x=0:del_theta:theta_max; %theta_max -> max angle in degrees 
y=sine_khan(x,n);% call sine_khan function and pass angle and term value

plot(x,y,'DisplayName','Taylor: sine') % plot graph 
xlabel('Angle (deg)')
ylabel('Sine');
hold on;
grid on;

% Matlab's sine function 
x1=0:del_theta:theta_max; % step size 

y1=sin(x/180*pi); % degree to rad conversion and sine value calculation
plot(x1,y1,'DisplayName','Matlab: sine')
xlabel('Angle (deg)')
ylabel('Sine');

%legend([y y1],'sin','Matlab sine')
lgd = legend;
lgd.FontSize = 14;
end

