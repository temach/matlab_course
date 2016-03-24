%function [x,flag,relres,iter,resvc,t]=zeidel(A,b,tol,maxit,x0)
% методы спуска (finding of minimum)
% это градиентный спуск
% есть еще координатный спуск
function [x,flag,relres,iter,resvec,t]=min_res(A,b,tol,maxit,x0)
x=x0;
flag=0;
r = b-A*x;
nr = norm(r,Inf);
nb = norm(b, Inf);
resvec(1) = nr;

% N = length(b);

for iter=1:maxit
    alfa = dot(A*r, r) / dot(A*r, A*r);
    t(iter) = alfa;
    x = x + alfa*r;
    r = b- A*x;
    nr = norm(r,Inf);
    resvec(iter+1) = nr;
    relres=nr/nb;       % note the slash
    if relres <= tol
        flag = 1;
        break;
    end
end
end









