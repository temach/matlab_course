%
% We want to solve this equation, but not find an exact solution
% we want to solve including the constraints
%
% for Ax = b
% we want to minimise the error in X
% 
% min[ ... ] means find the minimum x for which this is true
% here (b - Ax)' is (b - Ax) transposed
% x = min[ (b - Ax)' * (b - Ax) ]
% x = lscov(A,b)
%
% w is array of weights
% x = lscov(A,b,w)  = min[ (b - Ax)' * diag(w) * (b - Ax) ]
% 
% x = lscov(A,b,V) = min[ (b - Ax)' * V^(-1) * (b - Ax) ]

%%
% solve the problem of least squares

x1  =[0.2, 0.5, 0.6, 0.8, 1.0, 1.1]';
x2 = [0.1, 0.3, 0.4, 0.9, 1.1, 1.4]
A = [ones(size(x)), x1, x2];
b = [0.17, 0.26, 0.28, 0.23, 0.27, 0.34]'
z = A\b;
% mse tells us how far from the minimum we are at
[z2, stdx, mse] = lscov(A,b);
disp([z1, z2]);
disp(mse);

%%
% set different w\eights tell that the last arg is unimportant
w = [1, 1, 1, 1, 1, 0.1]';
z = A\b;
[z2, stdx, mse] = lscov(A,b);
disp([z1, z2]);
disp(mse);

%%
% for Ax = b
% we want to minimise the error in X
% minimise this: (|| Ax - b ||)^2 (make it as close to zero as possible)
% but this time we add some constraints for example x >=0
% 
% we will use lsqnonneg(A,b,options)


%%
%
% calculate pseudo inverse matrix
% A*B*A = A
% B*A*B = B
% A*B = эрмитова (симметричная но по комплексном сопряжении тоже
% симметрична)
% B*A = эрмитова (симметричная но по комплексном сопряжении тоже
% симметрична)
% lsconv we find the most suitable x for Ax=b chich does not have solutions
% with x = pinv(A) * b  we find the most suitable A^(-1)
% now given Ax = b
% use pinv
x = pinv(A) * b
% use standard solution
y = A\b;
% the x will be a closer solution than y (althouth there is no exact Ax=b solution) 








