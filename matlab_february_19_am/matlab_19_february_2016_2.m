%%
% we can already solve y = F(t,y)
% now we learn to solve F(t,y,y') = 0 
% becasue F(t,y,y') can not be changed into F(t,y) form
% матрица масс
% 
% M(t,y) * y' = F(t,y)
% if matrix M is constant then we can change to F(t,y) form
% 
% we are given a system 
% y1'(t) = -0.04 * y1(t) + 10^4*y2(t)*y3(t)
% y2'(t) = 0.04*y1(t) -10^4 *y(2)* - 3*1e4*(y2(t))^2
% 0 = y1(t) + y2(t) + y3(t) - 1
% matrix of mass is allows us to rewrite this system of equations in 
% M(t,y) * y' = F(t,y) form

function exampleMass

function f=rob(t,y)
f = zeros(3,1)
% this is out system of equations
f(1) = -0.04 * y(1) + 1e4*y(2)*y(3)
f(2) = 0.04 * y(1) - 1e4*y(2)*y(3) - 3e7*y(2)^2
f(3) = y(1) + y(2) + y(3) - 1
end

y0 = [1;0;0]
m = diag([1, 1, 0])
% reltol is accuracy
options = odeset('RelTol', 1e-4, 'mass', m)

% function, 
[t,y] = ode15s(@rob, [0, 100], y0, options)
subplot(3,1,1); plot(t,y(:,1))
subplot(3,1,2); plot(t,y(:,2))
subplot(3,1,3); plot(t,y(:,3))

end