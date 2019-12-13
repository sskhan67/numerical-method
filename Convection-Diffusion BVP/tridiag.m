function v = tridiag (e, f, g, r)

n=length(f);
% decomposition loop 
for k=2:n
    
    e(k)=e(k)/f(k-1);
    f(k)=f(k)-e(k)*g(k-1);
end

% forward substitution loop

for k=2:n
    r(k)=r(k)-e(k)*r(k-1);
    
end

% back substatutation loop
x(n)=r(n)/f(n);
for k=n-1:-1:1
    x(k)=(r(k)-g(k)*x(k+1))/f(k);
    
end
v=x;
end

