n=22
A = delsq(numgrid('S', n));
spy(A)
B = ones(length(A),1)

% choletsky incomplete (so we still have a sparse matrix)
R=ichol(A);

figure(5);
[x, flag, relres, iter,resvec] = pcg(A, b, 1e-6, 400);
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

















