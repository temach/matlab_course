% value = tells us event has occured 
% here value will be array of two values, because we work with only two
% events
% isterminal = should we break on this event
% direciton = which direction are we approaching the value from
% direction can be (-1, 0, +1) == (decreasing, steady, increasing)
function [value, isterminal, direction] = myevents(t,y,air_resist,mass)

% event_1 = fell on ground
% value = y(3) = 0  (happens when y(3) == 0)
% isterminal = 1 (true, break on this event)
% direction = -1 (we are falling)

% event_2 = fell on ground
% value = y(4) (happens when y(4) = 0, so derivative of speed on y is zero)
% isterminal = 0 (false, do't break)
% direction = 0 (we don't care about this)

value = [y(3), y(4)]
isterminal = [1, 0]
direction = [-1, 0];
end