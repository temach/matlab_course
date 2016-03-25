n=22
A = delsq(numgrid('S', n));
spy(A)
B = ones(length(A),1)
spy(B)

% choletsky incomplete (so we still have a sparse matrix) (preconditioner to help solve faster)
R=ichol(A);

figure(5);
% relres =  also returns the relative residual norm(b-A*x)/norm(b)
% iter = number fo iterations
% resvec  = a vector of the residual norms at each iteration including norm(b-A*x0)
[x, flag, relres, iter,resvec] = pcg(A,B, 1e-6, 400, R);
semilogy(0:iter, resvec,'.b'); grid on;

[x, flag, relres, iter, resvec]= pcg(A,B);
figure(2);
plot(resvec, '.r');

% plot in logarithmic
figure(3);
semilogy(0:iter, resvec,'.b');
grid on;
flag

% how many iteration did you take
iter

















