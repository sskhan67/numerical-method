
function v = bvp_khan (mat_khan, x, u )
% boundary value problem routine
% calls 'mat_name' function to get:
%   1)  diagonal vectors: e, f, g that form A-matrix
%   2)  r.h.s vector: b

% get matrix for differencing scheme
[e, f, g, b] = mat_khan (u, x) ;

% invert to solve -- use tridiagonal routine
v = tridiag (e, f, g, b) ;

end
