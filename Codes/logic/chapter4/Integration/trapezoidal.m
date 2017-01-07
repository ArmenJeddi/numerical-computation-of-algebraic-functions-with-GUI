function [steps, res] = trapezoidal(F_str, intvl, h, FPD)
%TRAPEZOIDAL calculates the intergral of the input function
%            in the desired interval using trapezoidal method

digits(FPD);

s = vpa(intvl(1));
e = vpa(intvl(2));

n = (e-s)/h;
steps = cell(n+7, 1);

steps{1} = 'Calculating f(x_i)s ...';
steps{2} = '';

f = vpa(eval(subs(F_str, s)));
steps{3} = ['f0 = f(', char(s), ') = ', char(f)];
res = f;

i = 1;
for x = (s+h):h:(e-h)
    f = vpa(eval(subs(F_str, x)));
    res = vpa(res + 2 * f);
    
    steps{i+3} = ['f', num2str(i), ' = f(', char(x), ') = ', ...
        char(f)];
    i = i+1;
end

f = vpa(eval(subs(F_str, e)));
res = res + f;
steps{i+3} = ['f', num2str(i), ' = f(', char(e), ') = ', char(f)];
steps{i+4} = '';


steps{i+5} = ['Answer = 0.5h[f0+2f1+2f2+...+2f', num2str(int32(n-1)), ...
    '+f', num2str(int32(n)), ']'];
steps{i+6} = ['       = 0.5 * ', char(vpa(h)), ' * ', char(res)];

res = vpa(h*res/2);

steps{i+7} = ['       = ', char(res)];

end