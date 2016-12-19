function [steps, res] = bisection(func_str, initial_interval, iter, FPD)
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
    
    mid = vpa((s+e)/2);
    
    %TODO store the points for ploting
    %disp([s, e]);
    
    % storing steps string
    substep = [s_str, ' = ', char(s), ' , ', ...
        e_str, ' = ', char(e)];
    steps{5*i-4} = substep;
    
    substep = [' -> f(', s_str, ')*f(', ...
        e_str, ') = (', char(f_s), ')*(', char(f_e), ...
        ') = ', char(vpa(f_s*f_e)), ' < 0'];
    steps{5*i-3} = substep;
    
    steps{5*i-2} = 'Bolzano''s theorem holds thus:';
    
    substep = ['x', num2str(i+1), ' = (', s_str, '+', e_str, ...
        ')/2 = ', char(mid)];
    steps{5*i-1} = substep;
    
    % terminate if f(mid) is zero
    if eval(subs(func_str, mid)) == 0,
        substep = ['Exact root found! f(', char(mid), ') = 0'];
        steps{5*i} = substep;
        break
    end
    
    steps{5*i} = '';
    
    % finding the next interval
    if eval(subs(func_str, mid))*f_s < 0,
        e = mid;
        e_str = ['x', num2str(i+1)];
    else
        s = mid;
        s_str = ['x', num2str(i+1)];
    end
    
    
end
res = mid;
end

