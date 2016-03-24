%%
% last time we learned "eig" function
%
% x = eigenvector
% lam = eigenvalue
% lam = максисальное собственное число
% х = правый собственный вектор
% А = матрица
% << A * x = lam * x >>

% у = левый собственный векторr
% (y)^(transposed) * A = lam * (y)^(transposed)
% << yT * A = lam * yT >>

% у = правый собственный вектор для А^(transposed)
% << AT * y = lam * y >>

%%
%
A = [4, -1, -2; 2, 1, -2; 1, -1, 1];
% get list of eigenvalues
d =eig(A);

% Vr = list of eigenvectors
% Dr = eigenvalues in diagonal
[Vr, Dr] = eig(A);

% A*x - lam * x (should be) = 0
A * Vr(:,1) - Dr(1,1) * Vr(:,1)

% Get left eigenvalues
[Vleft, Dleft] = eig(A.');
% << yT * A = lam * yT >>
Vleft(:,1).' * A - Dleft(1,1) * Vleft(:,1).';

%%
% eigenvals of diagonal (or upper diagonal) = diagonal
r = [1 2 3; 0, 3, 3; 0, 0, 5]
% will be [1, 3, 5]
eig(r)

%%
% find linearly independent vectors
[R, jb] = rref(Vr)
B = Vr(:,jb)

%% 
% eigenvectors can be complex
A2 = [0 2 4; 1 0 0 ; 0 1 0]
% we get complex eigen vecotrs as a result
[Vr, Dr] = eig(A2);
% complex to real
[V1, D1] = cdf2rdf(Vr,Dr)

% will be equal to initial values in Dr
d = eig(D1(2:3,2:3))

%%
% обобщенные собственные числа
% << A * x = lam * B * x >>
% where B is n-by-n
a = [6 -4 ; -4 7]
b = [-9 5; 5 -6]
[V, D] = eig(A,B);
% check that this is zero (we check just the first vector form the set)
A * V(:,1) - D(1,1)*B*V(:,1)

%%
% форма хейзенберга
% matrix form of hessenburg 
% (similar to row-echelon/triangular/canonical form)
% but one extra diagonal is filled
A = [3 2 6; -2 0 3; 1 5 2]
[P, H] = hess(A)
% now: P * H * P^(transpose) = A
% check
norm(P*H*P.' - A)

%%
% QZ - decomposition
A = rand(5,5)
B = rand(5,5)
[AA BB Q Z] = hess(A,B)
% AA = hess matrix
% BB = upper triangular
% Q,Z = othagonal matrices 
% check Q,Z orthagonal (chould give identity)
Q * Q.'
Z * Z.'
% check that both are zero
Q * A * Z - AA
Q * B * Z - BB

%%
% schur decompose
A = rand(5,5)
B = rand(5,5)
[U T] = schur(A,'real')
% U = orthogonal matrix
% T = upper triangular
% check that zero
norm(U*T*U.' - A)
norm(U*U' - eye(5,5))

%% 
% calculate with complex
% complex flag allows for complex values in matrix
[U T] = schur(A, 'complex')
% change from complex to real (add blocks)
[U1, T1] = cdf2rdf(U,T)

% calcualte with real
[U T] = schur(A,'real')
% change from real to complex ( remove blocks of real and put complex numbers in)
[U2, T2] = rsf2csf(U,T)

%%
% YAQRD
% Yet Another QR Decomposition
A = rand(5,5)
B = rand(5,5)
[AA,BB,Q,Z,V,W]=qz(A,B)

