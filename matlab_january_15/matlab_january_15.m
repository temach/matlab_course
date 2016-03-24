%%
% varargout is a special variable for holding many output values
% varargin is a special variable for holding many values
function y = myfunc(varargin)
% number of args input to a function (this is a special variable)
nargin
nargout % how many outputs the user requested
% use curly brackets to access elements
varargin{2} % get insige the second cell

% find minimum of function using quasi-neton method
myfunc = @(x) (sin(x))
x0 = [1;1]
[x,fval] = fminunc(@myfunc, x0);


