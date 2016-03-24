% first is that they the inequality is ok
% second is that the equality is ok
% this function will be passed to fmincon
% it must look exactly liek this one
% here x is a vector of values
function [ineq_ok, eq_ok]=myfunc_con(x)
% make the condition of inequality
ineq_ok = [];
% makle the condition of inequality
eq_ok = x(1).^2 + x(2).^2 - 2;
end



