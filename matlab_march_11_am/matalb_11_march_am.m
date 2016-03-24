%
% boundary value problem
%
% y'  =  f(x,y)
% solve the diff equation on a given interval [a, b]
% 
% function:
% sol = bvp4c(my_func, fun_boundary, initsol, options)
%
% matlab uses this to check conditions at boundary edges
% fun_boundary: h(y(a), y(b)) = 0
%
% _initsol_ is a struct into which you put an approximate solution,
% (you give it a function, and mattlab will choose the 
% closest to the function you gave)
%
% function:
% initsol = bvpinit(meshint, yint)
%
% meshint = array of values fo x to take (order by size) in [a,b] interval
% so meshint[0] == a and meshint[end] == b
% yint = value for y that is an approximate solution
%

% example solve:
% 
% on interval [0, 11*pi/2] 
% y'' = -sin(x)
% y'(11 * pi/2)  + y(11*pi/2) = -1
% y(0) = 0
%
% true solution is: y = sin(x) on [0, 11*pi/2] 
% 
% our solution first we rewrite:
% y1' = y2
% y2' = -sin(x)
% y1(0) = 0
% y2(11*pi/2) + y1(11*pi/2) + 1 = 0

function boundsproblem
% this is a vector of values at which we solve
meshinit = linspace(0,11*pi/2,5);
% we set two values here for y1 and y2 which are approximate solutions
yinit = [1, 0];
initsol = bvpinit(meshinit, yinit);

sol = bvp4c(@rside, @bound, initsol);

% plot the solution
plot(sol.x, sol.y(1,:), 'k.');
hold on;
% plot our approximate solution
plot(initsol.x, initsol.y(1,:), 'r+');
% plot the exact solution
fplot(@sin, [0, 11*pi/2]);

legend('numerical solution', 'initial approxiamtion for solution', 'exact solution');
end

% function to calculte the right hand side
function f=rside(x,y)
f = [y(2); -sin(x)];
end

% function to check that conditions at boundary edge are satisfied
function f=bound(ya, yb)
f = [ya(1); yb(2) + yb(1) + 1];
end




















