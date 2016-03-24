%%
% if ode has an "s" at the end the it is for rigid equations

[t,y] = ode15s(@myrigid, [0,1000], [2, 0]);
plot(t,y(:,1), '- .g');
hold on;

% this takes a hell load of  time
[t,y] = ode45(@myrigid, [0,1000], [2,0]);
plot(t,y(:,1), '- .b');