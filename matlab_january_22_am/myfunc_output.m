% will be called on each iteration of optimisation cycles
function stop=myfunc_output(x,vals,state)
% state = what type of iteration (initialization/search/end)
% vals = structure with function values
switch state
    case 'init'
        clf;    % clear figure
        myfunc_draw();
    case 'iter'
        [ineq, eq] = myfunc_con(x);
        
    case 'done'
        % do nothing
        shg; % show window on top of others
end

end