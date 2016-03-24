% this lesson has hunters/prey graph
% function that is called at every step to control our calcualtion
% such as: stop when this value is less than 100 (see MyOut fuinction)
% also see help on using "odeplot"
% the solution to hunter/prey diff equation is liek a spiral

function solve_hunter_prey
% y(1) is qty of prey
% y(2) is qty of hunters
y0 = [1000;1100];

% try increasing the time to [0, 10000]
[t, y] = ode23s(@lotVol, [0, 100], y0);
figure(1)
%subplot(1,2,1);
hold on;
legend('Hunters', 'Prey'); grid on;
plot(y(:,1), y(:,2));

option = odeset('OutputFcn', @MyOut)
% we can also supply our own jacobian matrix (because calculating it is
% expensive)
% option = odeset('OutputFcn', @MyOut, 'Jacobian', @MyJac)
[t, y] = ode23s(@lotVol, [0, 100], y0, option);
figure(2);
%subplot(1,2,2);
plot(y(:,1), y(:,2));
end


% y(1) is qty of prey
% y(2) is qty of hunters
function f = lotVol(t,y)
f = [0.8*y(1) - 0.01*y(1)*y(2); -y(2)+0.01*y(1)*y(2)];
end
    
function status=MyOut(t,y,flag)
status=(length(flag)==0)&&(y(1)<100);
end
    
function J=MyJac(t,y)
J = [0.8 - 0.01*y(2), -0.01*y(1);  0.01*y(2), -1 + 0.01*y(1)];
end