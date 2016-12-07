function [steps, res] = bisection(func_str, initial_interval, iter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%TODO handling num formats
steps = cell(5*iter, 1);
s = initial_interval(1);
e = initial_interval(2);

%TODO handling exceptions for invalid inputs

s_str = 'x0';
e_str = 'x1';

for i=1:iter,
    f_s = eval(subs(func_str, s));
    f_e = eval(subs(func_str, e));
    
    mid = (s+e)/2;
    
    %TODO store the points for ploting
    %disp([s, e]);
    
    % storing steps string
    substep = [s_str, ' = ', num2str(s), ' , ', ...
        e_str, ' = ', num2str(e)];
    steps{5*i-4} = substep;
    
    substep = [' -> f(', s_str, ')*f(', ...
        e_str, ') = (', num2str(f_s), ')*(', num2str(f_e), ...
        ') = ', num2str(f_s*f_e), ' < 0'];
    steps{5*i-3} = substep;
   
    steps{5*i-2} = 'Bolzano''s theorem holds thus:';
    
    substep = ['x', num2str(i+1), ' = (', s_str, '+', e_str, ...
        ')/2 = ', num2str(mid)];
    steps{5*i-1} = substep;
    
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

