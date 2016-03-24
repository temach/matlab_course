%function [x,flag,relres,iter,resvc,t]=zeidel(A,b,tol,maxit,x0)
% gradient (convergence?)
% метод сорпряженного градиентов
function [x,flag,relres,iter,alfa,beta]=con_grad(A,b,tol,maxit,x0)
x=x0;
flag=0;
r = b-A*x;
nr = norm(r,Inf);
nb = norm(b, Inf);
resvec(1) = nr;
% N = length(b);

% get direction 
p=r;

for iter=1:maxit
    B = dot(r,r);
    alfa_k = B / dot(A*p, p);
    
    % save to history, to view on graph
    alfa(iter) = alfa_k;
    x = x + alfa_k*p;
    
    % пересчитаем невязку
    r = r - alfa_k * A * p;
   
    nr = norm(r,Inf);
    resvec(iter+1) = nr;
    relres=nr/nb;       % note the slash
    
    % check the precision
    if relres <= tol
        % precision is good enouth
        flag = 1;
        break;
    end
    
    % else must recalculate direciton
    beta_k = dot(r,r) / B;
    p = r + beta_k*p;
    
    % save so we can view history later
    beta(iter) = beta_k;
end
end


