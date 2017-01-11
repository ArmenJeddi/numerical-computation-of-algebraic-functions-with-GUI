function [steps, res] = threepoint(F_str, pt, h, FPD)
%THREEPOINT Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
steps = cell(6, 1);

f = vpa(eval(subs(F_str, pt)));
fnxt = vpa(eval(subs(F_str, pt+h)));
fnxtnxt = vpa(eval(subs(F_str, pt+2*h)));

res = vpa((-3*f+4*fnxt-fnxtnxt)/(2*h));

steps{1} = 'The best method (with the lowest error) here';
steps{2} = 'is the Threepoint method :';
steps{3} = '';
steps{4} = 'f''_i = (-3f_i + 4f_(i+1) - f_(i+2)) / 2h';
steps{5} = ['      = (-3*', char(f), ' + 4*', char(fnxt), ' - ', ...
    char(fnxtnxt), ') / ', char(vpa(2*h))];
steps{6} = ['      = ', char(res)];

end

