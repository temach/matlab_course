% example: 
% we have t = [0, 4]
% we have k = [0.5, 1.5, 2]
% y1p = (pi/3)*(y2(t) + y1(t - 1.5) + y2(t-2))
% y2p = (-pi/3) * (y1(t) + y1(t - 2) + y2(t-0.5))
%
% prehistory: s(t) = [sin(pi * t) ; cos(pi*t) ] 
% will calculate this matrix on each step
%     [ y1(t - k1), y1(t - k2), y1(t - k3) ]
% z = |                                    |
%     [ y2(t - k1), y2(t - k2), y2(t - k3) ]
%
% sol is some matlab struct
% sol = dde23(@func, k, @prehistory, [t0, tmax])
% sol.x = time  values [t0, tmax]
% sol.y = solution at time sol.x
% sol.yp = y' at time sol.x
%
% true solution to example: y1 = sin(pi * t); y2 = cos(pi * t);
function ddetest
sol = dde23(@ddefunc, [0.5, 1.5, 2], @ddehist, [0, 4]);

% plot y1
figure(1);
subplot(2,1,1);
hold on;
plot(sol.x, sol.y(1,:),'o')
% true solution
y1 = inline('sin(pi*t)');
fplot(y1, [0, 4], 'r');
title('first function solution');
legend('approx solution', 'true/exact oslution');

% now we have calculated the solution at certain points sol.x
% what if we wanna calcualte solution at specific time?
% say we want to calculate at step size 0.1
yd = deval(sol, 0:0.1:4); 
plot(0:0.1:4,yd(1,:),'b');

% back to the solution we still need to plot y2
subplot(2,1,2);
hold on;
plot(sol.x, sol.y(2,:),'o')
% true solution
y2 = inline('cos(pi*t)');
fplot(y2, [0, 4], 'r');
title('Second function solution');
legend('approx solution', 'true/exact oslution');

end

% t = current time
% y = vector of (y1, y2) (the solution that solver has currently found)
% z is that big matrix
function F=ddefunc(t,y,z)
% y1p = (pi/3)*(y2(t) + y1(t - 1.5) + y2(t-2))
% y2p = (-pi/3) * (y1(t) + y1(t - 2) + y2(t-0.5))
F = [(pi/3)*(y(2) + z(1,2) + z(2,3)); ...
    (-pi/3)*(y(1) + z(1,3) + z(2,1))];
end

% this is the vlaue of the solver for the 
% times that we don't care about it (for times less than t0)
% takes only the time
function F=ddehist(t)
F = [sin(pi*t); cos(pi*t)];
end