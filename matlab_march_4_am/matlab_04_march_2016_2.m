% y'(t) = F( f, y(t), y(d1), y(d2), ..... y(dn), y'(p1), y'(p2), .... y'(pk))
% di = di(y,y(t)) 
% pi = pi(t, y(t))          (y'(p1) = value at derivative)
%
% note: di,pi must always return time < t
% sol = ddensd    << note the extra "n"
% 
% sol.X = time
% sol.Y = solutions at each time
% sol.yp = value of y' at each time
% sol.solver = 'ddesd' (the name of the solving function)
%
% ddesd(ddefunc, delay, delay_of_derivative, history, time_spawn, options)


% example we have a system:
% y'(t) = 1 + y(2) - 2 * (y(t/2)^2) - y'(t - pi)
%
% prehistory: t <= 0
% y(t) = cos(t)
% 
% t belongs to [0, pi]
% 

function example_ddesd_another
tstart = 0
tend = pi;

tspan = [tstart, tend]
sol = ddensd(@my_func, @my_delay, @my_der_delay, @my_hist, tspan)

% let's also plot the prehistory
t_hist = linspace(-pi,0);
y_hist = my_hist(t_hist);

% get the exact solution
t_exact = linspace(0, pi, 10);
% since the history function is the exact solution in this example
y_exact = my_hist(t_exact);
 
% plot our solution at a different time values
t_other = linspace(0,pi);
y_other = deval(sol, t_other);

figure(1); hold on;
% you have to plot them on one plot command so
% matlab chooses the correct axis size
plot(t_hist,y_hist,'k',t_exact, y_exact,'b',t_other,y_other,'ro');
legend('history', 'analitic solution', 'numeric solution');

grid on;
xlabel('time t');
ylabel('solution for y');
end

function v=my_hist(t)
v = cos(t);
end

function der=my_der_delay(t,y)
der = t - pi;
end

function d=my_delay(t,y)
d = t/2;
end

% the Z parameter comes from my_delay function
% whatever you put into d in my_delay will show up in Z_delay_solution
% here both Z_* will be scalars
function dydt=my_func(t,y,Z_delay_solution, Z_delay_derivative)
dydt = 1 + y - 2 * Z_delay_solution^2 - Z_delay_derivative;
end






