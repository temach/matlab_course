% example of how
function solvedm
y0 = [1;0]
[t_res,y_res] = ode113(@oscil, [0, 15], y0);

% red is the solution
plot(t_res,y_res(:,1),'r.-');
hold on;
% green is y'
plot(t_res,y_res(:,2),'g.-');
grid on;

% returns the vector P for the system;
% P = [y; z]
function F=oscil(t,y)
F = [y(2); -2*y(2) - 10*y(1) + sin(t)];
end
end