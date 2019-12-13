function [ xoverL, u ] = fe_template_khan( nodes )
% function to run Finite Element method for heat conduction
clc

% parameters
qgen = 2e5 ; % heat generation (W/m^3)
L = 0.05 ;   % length (m)
h = 50 ;     % convection coef (W/m^2-K)
k = 10 ;     % conductivity   (W/m-K)
Tinf = 25 ;  % surrounding T (C)
qo = 3000 ;  % heat flux at x=0 boundary (W/m^2)

% analytical soln
xa = 0: 0.05 :1 ;
Ta = Tinf + qgen*L/h  - qo/h + qgen*L^2 /(2*k)*(1 - xa.^2) ...
      + qo*L/k *( xa - 1)

  
%  mesh  

dx=L/(nodes-1);

% stiffness matrix
A = stiff_matrix ( h, k, dx, nodes ) ;

% forcing vector
F = force_vect ( nodes, qgen, k, qo, dx, h, Tinf) ;

% matrix solve
u = linsolve(A,F) ;

% post process
dx_h=1/(nodes-1) ;
xoverL=0:dx_h:1;

figure(2)
plot(xa, Ta) ;
xlabel ('Distance (scaled)') ;
ylabel ('T(C)') ;
grid on
hold on
plot (xoverL, u, 'o') 

end

function A = stiff_matrix ( h, k, dx, n ) 
%  assemble stiffness matrix

%A = zeros(n, n) ;
% diagonal
v(1,n)=zeros;
v(1,1)=1;
v(1,n)= (1+ h*dx/k);
v(1,2:n-1)=2;
A=diag(v);

for i=2:n-1
    for j=2:n-1
        if i==j
        A(i,j-1)=-1 ;
        A(i,j+1)=-1;
        A(i-1,j)=-1;
        A(i+1,j)=-1;

        end
    end
end


% endpoints


% below diagonal


% above diagonal

end


function F = force_vect ( n, qgen, k, qo, dx, h, Tinf) 
% fill forcing vector for r.h.s of matrix equation

F(n,1)=zeros;

F(1,1)= (-qo/k)*dx + (0.5*qgen/k*dx^2);
F(n,1)= ( (h*dx/k)*Tinf )+ ( 0.5*qgen/k*dx^2 );

F(2:n-1,1)= qgen/k*dx^2 ; 
end
