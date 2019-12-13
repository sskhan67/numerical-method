function y = sine_khan(theta,n)
% function to approximate sine by taylor series
% Syeduzzaman Khan
% input: theta= angle in degrees
% n=number of temrs in approx series
% output: y=sine value (dimensionless)
% sample: sine_khan(60,4)
sum=0;
x=theta/180*pi; % convert angle to radians
    for i=1:n
        k=2*i-1;
        sum=sum+(-1)^(i-1)*x.^k/factorial(k); % calculate sine value   
    end
y=sum;



end

