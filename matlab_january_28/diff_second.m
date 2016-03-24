function y=diff_second(diff,x0,varargin)
% function to calculate differential
% this is matlab janyary 28
function y=diff_compare(func,x0,varargin)
% this is the optimal step size
h = 1e-8;
if nargin > 2
    % note the curly brackets
    h = varargin{1};
end
y = (func(x0+h) - func(x0-h)) / (2*h);

if nargin > 3
    s = varargin{2};
    if s == 0
        y = (func(x0+h) - func(x0-h)) / (2*h); 
    elseif s == 1
        y = (func(x0+h) - func(x0)) / (h); 
    else
        y = (func(x0) - func(x0-h)) / (h); 
    end
end

end
