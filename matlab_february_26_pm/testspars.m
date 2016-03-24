clear;clc;
n=3000;
% first with sparce matrices
AN=sprand(n,n,10/n);%razrazh (величина, % заполнения)
BN=sprand(n,n,10/n);
tic; 
CN=AN*BN; 
toc
%измеряет время выполнения
disp([nnz(AN) nnz(BN)]);
% now with full matrices
A=full(AN);
B=full(BN);
tic; 
C=A*B; 
toc
%%
clear;clc;
A=[10 0 0; 0 0 20; 30 40 0];
S=sparse(A);
% will get a matrix with mostly one's
B=cos(S)
% if the elements in matrix were 0 then spfun will ignore them.
% this functions will have mostly zeros
BN=spfun(@cos,S)
BN=spfun(@sin,S)
%%
n=150;
AN=sprand(n,n,0.01); 
%для разложения Холецкого м-ца симметричная и положительно определенная
% so fix the random matrix to be suitable
% make it симметричная
AN=AN+AN'; 
% make it положительно определенная
AN=AN+100*speye(n);

subplot(3,3,1);
spy(AN); title('AN');
RN=chol(AN);
subplot(3,2,2); spy(RN); title('RN: AN=RN^T*RN');
%Перестановка строк-столбцов, чтобы м-ца была более разряженной:
perm=symrcm(AN);
subplot(3,2,3);spy(AN(perm,perm)); title('AN после перестановок');
RN2=chol(AN(perm,perm));
subplot(3,2,4); spy(RN2); title('RN: после перестановок symrcm');

perm=symamd(AN);
subplot(3,2,5);spy(AN(perm,perm)); title('AN после перестановок');
RN2=chol(AN(perm,perm));
subplot(3,2,6); spy(RN2); title('RN: после перестановок symamd');
%%
clear;clc;
n=4000;
AN=sprand(n,n,0.0003);
AN=AN+AN'; AN=AN+2*n*speye(n);
x=(1:n)'; b=AN*x;

% if we solve this head on
tic
R=chol(AN);
x=R\(R'\b);
fprintf('Время решения chol %f \n', toc);
%ТЕперь то же самое для м-цы перестновок
% check if this wii be faster
tic
perm=symrcm(AN);
R1=chol(AN(perm,perm));
% remember to apply the permutation to "b" as to AN
x=R1\(R1'\b(perm));
% also we must apply the permutation to x the same as to AN
x(perm)=x;
fprintf('Время решения chol + symrcm%f \n', toc);


%%
n = 1000;
AN = sprand(n,n,0.005);
% make it positively defined
AN = AN + 2*n*speye(n);
% generate random vector of logarithmically spaced values
% form 10^(-7), to 10^(-2) put 30 values
Tresh = logspace(-7, -2, 30)
Nonz = [];
for tr=Tresh
    [L, U, P, Q] = lu(AN, tr);
    Nonz = [Nonz, nnz(L+U)];
end
figure(2)
grid on;
semilogx(Tresh, Nonz);

%%
clear;clc;
n=100; I = ones(n,1); D = spdiags(-I,0,n,n);
T=spdiags([I, -2*I, I], [-1, 0, 1], n, n)
% kron = builds up a block matrix (every element is expanded to a matrix)
AN = kron(D,T) + kron(T,D)

x_ex = (1:n*n)'; 
b = AN * x_ex;

% froptolerance option for ichol function
DROPTOL = logspace(-6, 0, 20);
ITER = []

for dr=DROPTOL
    options=struct('type','ict','droptol',dr);
    R = ichol(AN, options)
    [x, flag, relres,qty_iter] = pcg(AN, b, 1e-10, 1000, R', R);
    ITER=[ITER, qty_iter];
end

figure(3);
loglog(DROPTOL,ITER);
    