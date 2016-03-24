%
%
% y' = derivative
% solve y' = F(t,y)
% M(t,y) * y' = F(t,y)
% F(t,y,y') = 0
% specifically for this type:
% [T,Y] = ode15i(@func, [t0, tmax], Y0, Y_derivative_0, options)
%
% we must also solve F(t0, y0, y_derivative_at_y0) = 0
% this has many solutions so we must fix the initial values
% to get the right solutions
% [y0, y_der_y0] = decic(@somefunc, t0, y0init, y0flag, y_der_init,
% y_der_flag)
%
%
%
% example: y = y' * t + e^(y')
% given: y(0) = e
% t belongs [0, 5]
%










