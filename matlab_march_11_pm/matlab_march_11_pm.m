%
% ilu function
% bicg function
%
%
%

% A = some matrix
% b = 
tol = 1e-12;
maxit = 20;
[x0],fl0, rr0,it0,rv0] = bicg(A,b,tol,maxit);
[L,U] = ilu(A,struct('type','ilutp','droptol',1e-6);




















