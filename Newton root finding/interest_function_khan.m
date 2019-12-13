function [fi] = interest_function_khan(i)
% [fx] = interest_function_khan(i) evaluates interest rates 
% input: i interest rate 
% output: [fx]=returns functions   
%Parameters: P=present worth in USD, A=annual payment in USD, n= years

P=20000;   
A= 4000;  
n=6;
fi=(P.*((i.*(1+i).^n)./((1+i).^n-1)))-A ;
end

