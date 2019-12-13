function [e, f, g, b] = mat_khan (u, x)

R=u(1);

[h,n]=size(x);

e=zeros(n,h);
for i=2:n-1
    dx=x(i)-x(i-1);
    e(i)=-R*dx/2-1;
        
end

f=ones(n,h);
for i=2:n-1
    f(i)=2;
    
end
f(1)=1;
f(n)=1;

g=zeros(n,h);
for i=2:n-1
    dx=x(i)-x(i-1);
    g(i)=R*dx/2-1;
        
end


b=zeros(n,h);
b(n)=1;


end

