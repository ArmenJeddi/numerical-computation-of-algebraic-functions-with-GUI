function [steps, res] = falsePosition(func_str, initial_interval, iter, FPD)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
steps = cell(5*iter, 1);
s = vpa(initial_interval(1));
e = vpa(initial_interval(2));

%TODO handling exceptions for invalid inputs

s_str = 'x0';
e_str = 'x1';

for i=1:iter,
    f_s = vpa(eval(subs(func_str, s)));
    f_e = vpa(eval(subs(func_str, e)));
    
    next = vpa(e-(e-s)/(f_e-f_s)*f_e);
    
    %TODO store the points for ploting
    %disp([s, e]);
    
    % storing steps string
    substep = [s_str, ' = ', char(s), ' , ', ...
        e_str, ' = ', char(e)];
    steps{5*i-4} = substep;
    
    substep = ['-> f(', s_str, ')*f(', ...
        e_str, ') = (', char(f_s), ')*(', char(f_e), ...
        ') = ', char(vpa(f_s*f_e)), ' < 0'];
    steps{5*i-3} = substep;
    
    steps{5*i-2} = 'Bolzano''s theorem holds thus:';
    
    substep = ['x', num2str(i+1), ' = ', e_str, ' - ', ...
        'f(', e_str, ')*(', e_str, '-', ...
        s_str, ')/(f(', e_str, ')-', 'f(', s_str, '))', ' = ', char(next)];
    steps{5*i-1} = substep;
    
    % terminate if f(next) is zero
    if eval(subs(func_str, next)) == 0,
        substep = ['Exact root found! f(', char(next), ') = 0'];
        steps{5*i} = substep;
        break
    end
    
    steps{5*i} = '';
    
    % finding the next interval
    if eval(subs(func_str, next))*f_s < 0,
        e = next;
        e_str = ['x', num2str(i+1)];
    else
        s = next;
        s_str = ['x', num2str(i+1)];
    end
    
    
end
res = next;

end

