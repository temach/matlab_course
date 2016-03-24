x0 =[0, 0];

% this is just to enable monitoring of function progress
options = optimset('OutputFcn', @myfunc_output);

[xopt, fval, flag] = fmincon(@myfunc, x0, [], [], [], [], [], [], @myfunc_con, options);

