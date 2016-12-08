function [steps, res] = secant(func_str, initial_interval, iter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%TODO handling num formats
steps = cell(3*iter, 1);
s = initial_interval(1);
e = initial_interval(2);

%TODO handling exceptions for invalid inputs

s_str = 'x0';
e_str = 'x1';

for i=1:iter,
    f_s = eval(subs(func_str, s));
    f_e = eval(subs(func_str, e));
    
    next = (s*f_e-e*f_s)/(f_e-f_s);
    
    %TODO store the points for ploting
    %disp([s, e]);
    
    % storing steps string
    substep = [s_str, ' = ', num2str(s), ' , ', e_str, ...
        ' = ', num2str(e)];
    steps{3*i-2} = substep;
    
    substep = [' -> x', num2str(i+1), ' = (', s_str, '*f(', ...
        e_str, ')-', e_str, '*f(', s_str, '))/(f(', e_str, ...
        ')-f(', s_str, ')) = ', num2str(next)];
    steps{3*i-1} = substep;
    
    % terminate if f(next) is zero
    if eval(subs(func_str, next)) == 0,
        substep = ['Exact root found! f(', num2str(next), ') = 0'];
        steps{3*i} = substep;
        break
    end
    
    steps{3*i} = '';
    
    s = e;
    s_str = ['x', num2str(i)];
    e = next;
    e_str = ['x', num2str(i+1)];
    
end
res = next;

end

