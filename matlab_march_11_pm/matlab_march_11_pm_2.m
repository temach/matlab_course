% L-D-L decomposition
% only for ermite matrices

% matlab function to get positively defined 
A = full(delsq(numgrid('L',10)));

% M is ermite function, but undefined (positive/negavite)
B = gallery('uniformdata', 10, 0)
M = [eye(10), B; B', zeros(10)]

% get the decomposition
[La, Da] = ldl(A);

% check answer is zero
norm(A - La*Da*La');
% search the matrix array for negative elements, (should be zero of them)
nen = find(diag(Da) < 0)

% now that we have the decomposition lets solve something
% make up the target "ba" so we will have "A*x = ba"
ba = sum(A,2)

y = La \ ba;
z = Da \ y;
x = La' \ z;
% or the same
xxx = La'\(Da\(La\ba))

% check the answer
norm(x - ones(size(ba)))

% function tril(matrix) returns lower triangular part of the matrix
spy(A)
figure(2)
spy(La)
figure(3)
spy(Da)

% A = matrix
% R = chol(A)
% to find chol(B) where B = A + x*x'
% we can use:
% cholupdate(R, x)
%
% also there is qrupdate()

