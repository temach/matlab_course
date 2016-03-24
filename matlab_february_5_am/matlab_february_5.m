% ode45 fourth order runge kutta
% ode23 second order
% [T, Y] = solver(odefunc, tapan, y0)
% T is the x valuies, Y is the corresponding y values. (to graph this shit)
y0 = [1;0]
[t_res,y_res] = ode113(@oscil, [0, 15], y0);

% red is the solution
plot(t_res,y_res(:,1),'r.-');
hold on;
% green is y'
plot(t_res,y_res(:,2),'g.-');
grid on;

%%
clear;
clc;
clf;

% T is the x valuies, Y is the corresponding y values. (to graph this shit)
% initial condition
y0 = [-cos(-5)]
% y_res will have only one row
% t_res will have one row
[t_res,y_res] = ode113(@oscil_simple, [-5 5], y0);

% red is the found numeric solution
plot(t_res,y_res(:,1),'r.-');
hold on;
% green is true solution
plot(t_res,-cos(t_res),'g.-');
grid on;


%%
% note: This problem does NOT have a proper solution, because accuracy is
% too low
clear;
clc;
clf;

% helper constant
a = 0.001

% initial condition
y0 = [log(a); 1/a]
%search in interval
interval = [a, 100];

% find solution
% y_res has two rows. For y1 and for y2
% t_res has one row
[t_res,y_res] = ode113(@system_1, interval, y0);

hold on;
grid on;

% red is the found numeric solution for y1
% plot just the numeric solution to y1
plot(t_res,y_res(:,1),'r.-');

% green is true solution to y1
% plot just the y1 solution
plot(t_res,log(t_res),'g.-');




%%
% This is same problem as previous, but with increased accuracy and
% plotting of both numeric solutions y1,y2 and their true solutions
clear;
clc;
clf;

% helper constant
a = 0.001
% initial condition
y0 = [log(a); 1/a]
%search in interval
interval = [a, 100];

% set the accuracy to be more precise
options = odeset('RelTol',1e-7);
% call like
[t_res,y_res] = ode113(@system_1, interval, y0, options);

hold on;
grid on;

% red is the found numeric solution for y1
plot(t_res, y_res(:,1),'r.-');
% red is the found numeric solution for y2
plot(t_res, y_res(:,2),'y.-');

% green is true solution to y1
plot(t_res, log(t_res),'g.-');
% green is true solution to y2
plot(t_res, 1./t_res,'b.-');

