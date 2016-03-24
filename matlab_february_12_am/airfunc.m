
% function to calculate derivate for the canon
% ball at certain point in time
% t = time (the x value)
% y = [x_val, dx_val, y_val_dy_val]
function dydt=airfunc(t, y, air_resist, mass)
g = 9.8
% this is just some random math function for canon ball trajectory
dydt = [y(2); -air_resist * sqrt(y(2)^2 + y(4)^2)*y(2)/mass; ...
    y(4); (-air_resist * sqrt(y(2)^2 + y(4)^2) * y(4)/mass) - g];
end