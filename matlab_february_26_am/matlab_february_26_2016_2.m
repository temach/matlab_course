%solving unodrdinary differential equations
% they are called __delay differential equations__ (DDE)
% y'(t) = F( t, y(t), y(t - k1), y(t - k2), ..... y(t - kn))
% and t belongs to [t0, tmax]
% k1...kn - constants and > 0
% and k1<k2<...<kn
% so y(t-k1) is lagging behind y(t)
% and y(t - k2) is lagging behind y(t-k1) and y(t)
% steps to success:
% 1. function to calculate the right hand side 
%  F(t, y(t), y(t - k1), y(t - k2), ..... y(t - kn))
% 2. function to go back in time (prehistory)
%  y(t) for when t < t0 (i.e. how to calculate y(t - k1) when t = t0)
% 3. give options
% 4. show the shit on screen
%
%
%
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








