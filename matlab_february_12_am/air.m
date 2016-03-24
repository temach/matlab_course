%% matlab 12/02/2016 am
% alpha - start angle 
% air_resist - koefficient of air resistance
% mass - weight of canon ball
% v0 - initial speed of canon ball
% y0 - starting height of canon ball
function [t,y]=air(alpha,air_resist,mass,v0,y0,varargin)

% if args is empty run multiple demonstrations
if nargin < 1
    shg
    ylim([0, Inf]);
    daspect([1,1,1])
    hold on
    xlabel('x');
    ylabel('y')
    grid on;
    % just random vals to show stuff off
    air(pi/4, [], [], [], [], 'b:')
    air(pi/6, [], [], [], [], 'm:')
    air(pi/3, [], [], [], [], 'k:')

    % now add small air resistance
    air(pi/4, 1e-2, [], [], [], 'b--')
    air(pi/6, 1e-2, [], [], [], 'm')
    air(pi/3, 1e-2, [], [], [], 'k')
    
    % the strings go in the order that lines are drawn on the graph
    legend('\pi over 4',  ...
        '\pi over 6', ...
        '\pi over 3', ...
        '\pi over 4 with ari resist', ...
        '\pi over 6 with ari resist', ...
        '\pi over 3 with ari resist');
    return;
end

% now if we should acrually do something
% set default values
if isempty(alpha)
    alpha = 4;
end
if nargin < 2 || isempty(air_resist)
    air_resist = 1e-7;
end
if nargin < 3 || isempty(mass)
    mass = 1;
end
if nargin < 4 || isempty(v0)
    v0=20;
end
if nargin < 5 || isempty(y0)
    y0 = 0;
end
options = odeset('Events', @myevents);

% t, y, te, ye, ie
% all time values at which we sampled
% value of function at each time value
% time value when event happened
% value of function when event happened
% index of event when it happened
% note: values are only put into te,ye,ie when an event happens
%
% note that to ode45 we give [0, v0*cos(alpha), y0, v0*sin(alpha)]
% hwich is [x_start, x_change_func, y_start, y_change_func]
[t,y,te,ye,ie]=ode45(@airfunc, [0;Inf], ...
    [0, v0*cos(alpha), y0, v0*sin(alpha)], options, air_resist, mass);

% we plot the 
plot(y(:,1), y(:,3), varargin{:});

% disp is for showing arrays
disp('****************************');
disp(['alpha=', num2str(alpha) '; air_resist= ' num2str(air_resist)]);

% we agreed that event_1 == fell on the ground
% and event_2 == reached maximum height
len = ye(find(ie==1),1);
tm = te(find(ie==1));
height = ye(find(ie==2),3);
tmup = te(find(ie == 2));

disp(['max length traveled in x axis = ' num2str(len)])
disp(['full time in air = ' num2str(tm)])
disp(['time travelling upwards = ' num2str(tmup)])
disp(['maximum height = ' num2str(height)])
end












