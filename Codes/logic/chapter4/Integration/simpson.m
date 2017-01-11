function [steps, res, errdlg] = simpson(type, F_str, intvl, h, FPD)
%SIMPSON calculates the intergral of the input function
%        in the desired interval using simpson 1/3 or 3/8 method

%   type should be either 'one third' or 'three eighths'

digits(FPD);

s = intvl(1);
e = intvl(2);

n = (e-s)/h;
steps = cell(n+7, 1);

% checking for errors in number of points
if strcmp(type, 'one third')
    if n <= 1
        errdlg = ['Error: Few points to calculate!', ...
            ' At least 3 points must exist.'];
        res = 0;
        return
    elseif mod(n, 2) ~= 0
        errdlg = ['Error: Unvalid number of points for Simpson 1/3!', ...
            ' There should be an odd number of points', ...
            ' (n should be even).'];
        res = 0;
        return
    end
else
    if n <= 2
        errdlg = ['Error: Few points to calculate!', ...
            ' At least 4 points must exist.'];
        res = 0;
        return
    elseif mod(n, 3) ~= 0
        errdlg = ['Error: Unvalid number of points for Simpon 3/8!', ...
            ' There should be 3k+1 (k>=1) number of points', ...
            ' (n = 3k).'];
        res = 0;
        return
    end
end

errdlg = 'none';

steps{1} = 'Calculating f(x_i)s ...';
steps{2} = '';

f = vpa(eval(subs(F_str, s)));
steps{3} = ['f0 = f(', num2str(s), ') = ', char(f)];

res = 0;
i = 1;
if strcmp(type, 'one third')
    
    % simpson 1/3
    
    for x = (s+h):(2*h):(e-h)
        fprev = vpa(eval(subs(F_str, x-h)));
        f = vpa(eval(subs(F_str, x)));
        fnxt = vpa(eval(subs(F_str, x+h)));
        res = vpa(res + fprev + 4 * f + fnxt);
        
        steps{i+3} = ['f', num2str(i), ' = f(', num2str(x), ...
            ') = ', char(f)];
        steps{i+4} = ['f', num2str(i+1), ' = f(', num2str(x+h), ...
            ') = ', char(fnxt)];
        i = i+2;
    end
    
    steps{i+3} = '';
    
    if n > 5
        steps{i+4} = ['Answer = (h/3)[f0+4f1+2f2+...+2f', ...
            num2str(n-2), '+4f', num2str(n-1), ...
            '+f', num2str(n) ']'];
    elseif n == 4
        steps{i+4} = 'Answer = (h/3)[f0+4f1+2f2+4f3+f4]';
    elseif n == 2
        steps{i+4} = 'Answer = (h/3)[f0+4f1+f2]';
    end
    
    steps{i+5} = ['       = (1/3) * ', num2str(h), ' * ', char(res)];

    res = vpa(h*res/3);

    steps{i+6} = ['       = ', char(res)];

else
    
    % simpson 3/8
    
    for x = (s+h):(3*h):(e-2*h)
        fprev = vpa(eval(subs(F_str, x-h)));
        f = vpa(eval(subs(F_str, x)));
        fnxt = vpa(eval(subs(F_str, x+h)));
        fnxtnxt = vpa(eval(subs(F_str, x+2*h)));
        res = vpa(res + fprev + 3 * (f+fnxt) + fnxtnxt);
        
        steps{i+3} = ['f', num2str(i), ' = f(', char(x), ...
            ') = ', char(f)];
        steps{i+4} = ['f', num2str(i+1), ' = f(', char(x+h), ...
            ') = ', char(fnxt)];
        steps{i+5} = ['f', num2str(i+2), ' = f(', char(x+2*h), ...
            ') = ', char(fnxtnxt)];
        i = i+3;
    end
    
    steps{i+3} = '';
    
    if n > 7
        steps{i+4} = ['Answer = (3h/8)[f0+3f1+3f2+2f3+3f4+...+2f', ...
            num2str(n-3), '+3f' num2str(n-2), '+3f', num2str(n-1), ...
            '+f', num2str(n) ']'];
    elseif n == 6
        steps{i+4} = 'Answer = (3h/3)[f0+3f1+3f2+2f3+3f4+3f5+f6]';
    elseif n == 3
        steps{i+4} = 'Answer = (3h/3)[f0+3f1+3f2+f3]';
    end
    
    steps{i+5} = ['       = (3/8) * ', num2str(h), ' * ', char(res)];

    res = vpa(3*h*res/8);

    steps{i+6} = ['       = ', char(res)];

end

end