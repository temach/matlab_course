% y'(t) = F( f, y(t), y(d1), y(d2), ..... y(dn))
% di = di(y,y(t)) 
% note: di must always return time < t
% when: di = y - k1   
% then we get simplification that we solved with ode23s
%
% sol = ddesd
% 
% sol.X = time
% sol.Y = solutions at each time
% sol.yp = value of y' at each time
% sol.solver = 'ddesd' (the name of the solving function)
%
% ddesd(ddefunc, delay, history, time_spawn, options)


% example we have a system:
% y1'(t) = y2'(t)
% y2'(t) = -y2( e^(1 - y2(t)) ) * y2(t)^2 * e^(1 - y2(t))
%
% prehistory: t < 0.1
% y1(t) = ln(t)
% y2(t) = 1/t
% 
% t belongs to [0.1, 5]
% d1 = e^(1 - y2(t))

function example_ddesd
tstart = 0.1
tend = 5;

tspan = [tstart, tend]
sol = ddesd( @my_func, @my_delay, @my_hist, tspan)

% get the exact solution
lin_t_spawn = linspace(tstart,tend)
% since the history function is the exact solution in this example
yexact = my_hist(lin_t_spawn)

figure(1); hold on;
plot(lin_t_spawn,yexact,sol.x,sol.y,'o');
%plot(lin_t_spawn,yexact(1),'o')
%label('exact y part 1');
%plot(lin_t_spawn,yexact(2),'o')
%label('exact y part 2');
%plot(sol.x,sol.y(1),'o')
%label('approximate solution part 1');
%plot(sol.x,sol.y(2),'o')
%label('approximate solution part 2');

grid on;
xlabel('time t');
ylable('solution for y');
end

function v=my_hist(t)
v = [log(t); 1./t];
end


function d=my_delay(t,y)
d = exp(1 - y(2));
end

% the Z parameter comes from my_delay function
% whatever you put into d in my_delay will show up in Z
function dydt=my_func(t,y,Z)
dydt = [y(2); -Z(2) * y(2)^2 * exp(1 - y(2))]
end
















%