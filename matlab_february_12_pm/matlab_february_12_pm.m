% using profiler (Run and Time)
n = 20;
e = ones(n,1);
sn = spdiags([-e, 3*e, -e], -1:1, n, n);
sn(1,n) = 1;
sn(n,1) = 1
rn = chol(sn)

%%
n = 500;
a = rand(n,n);
b = rand(n,n);
c = a*b;

% custom matrix multiply (just like normal a*b
ccc = zeros(n,n)
for i=1:n
    for j=1:n
        s = 0;
        for k = 1:n
            s = s + a(i,k) * b(k,i);
        end
        ccc(i,j) = s;
    end
end

%%
n = 100;
a = rand(n,n);
% calc all eigen values
all_vals = eig(a)
% calculate only some eigenvalues (with conditions)
some_vals = eigs(a,1);

% convert matlab symbolic function to c code
% ccode(some_sybolic_value)

            