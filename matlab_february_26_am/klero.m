% matlab 26 february 2016
% example: y = y' * t + e^(y')
% given: y(0) = e
% t belongs [0, 5]
% so we want the example equation to hold for all given value of t
function klero

t0 = 0;
% since y(0) = e
Y0init = exp(1);
% because this is fixed by the problem, so don't change this
Y0flag = 1

% Yp = y - ptoizvodnaja, choose this randomly, since
% this is just initial value to search from
Yp0init = 0;
% set to zero because we are looking for this
Yp0flag = 0;

% now we found all initial conditions
[Y0, Yp0] = decic(@klerofunc, t0, Y0init, Y0flag, Yp0init, Yp0flag);
% Yp0 will be the found derivative that suit the equation

% now we can solve, must use special solver because we have derivatives
[T,Y] = ode15i(@klerofunc, [t0, 5], Y0, Yp0);

plot(T,Y,'o')
hold on
% we know the exact solution
exsol=inline('x + exp(1)');
fplot(exsol, [t0, 5]);

end


% before was klerofunc(t,y)
% t = current time
% y = current y value
% yp - y proizvodnaja (current y derivative)
function F=klerofunc(t,y,yp)
% rewrite the function as F(t,y,y') = 0
F = y - yp*t - exp(1) ^ (yp);
end












