% function to calculate differential
% this is matlab janyary 28
function y=diff_central(func,x0,varargin)
% this is the optimal step size
h = 1e-8;
if nargin > 2
    % note the curly brackets
    h = varargin{1};
end

% first formula
y = (func(x0+h) - func(x0-h)) / (2*h); 

%second formula
% y2 = (f(x0
end
