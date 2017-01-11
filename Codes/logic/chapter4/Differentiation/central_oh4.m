function [steps, res] = central_oh4(F_str, pt, deg, h, FPD)
%CENTRAL_OH4 Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
steps = cell(6, 1);

fppp = vpa(eval(subs(F_str, pt-3*h)));
fpp = vpa(eval(subs(F_str, pt-2*h)));
fp = vpa(eval(subs(F_str, pt-h)));
f = vpa(eval(subs(F_str, pt)));
fn = vpa(eval(subs(F_str, pt+h)));
fnn = vpa(eval(subs(F_str, pt+2*h)));
fnnn = vpa(eval(subs(F_str, pt+3*h)));

steps{1} = 'The best method (with the lowest error) here';
steps{2} = 'is the Central Differencing with O(h^4) error :';
steps{3} = '';

switch deg
    case 1
        res = vpa((-fnn+8*fn-8*fp+fpp)/(12*h));
        
        steps{4} = ['f''_i = (-f_(i+2) + 8*f_(i+1) - 8*f_(i-1) + f_(i-2))', ...
            ' / (12*h)'];
        steps{5} = ['      = (-(', char(fnn), ') + 8*', char(fn), ' - 8*', ...
            char(fp), ' + ', char(fpp), ') / ', char(vpa(12*h))];
        steps{6} = ['      = ', char(res)];
        
    case 2
        res = vpa((-fnn+16*fn-30*f+16*fp-fpp)/(12*h^2));
        
        steps{4} = ['f''''_i = (-f_(i+2) + 16*f_(i+1) - 30*f_i + ' ...
            '16*f_(i-1) - f_(i-2)) / (12*h^2)'];
        steps{5} = ['      = (-(', char(fnn), ') + 16*', char(fn), ...
            ' - 30*', char(f), ' + 16*', char(fp), '- (', char(fpp), ...
            ') / ', char(vpa(12*h^2))];
        steps{6} = ['      = ', char(res)];
        
    case 3
        res = vpa((-fnnn+8*fnn-13*fn+13*fp-8*fpp+fppp)/(8*h^3));
    
        steps{4} = ['f_3rd_i = (-f_(i+3) + 8*f_(i+2) - 13*f_(i+1) + ' ...
            '13*f_(i-1) - 8*f_(i-2) + f_(i-3)) / (8*h^3)'];
        steps{5} = ['      = (-(', char(fnnn), ') + 8*', char(fnn), ...
            ' - 13*', char(fn), ' + 13*', char(fp), '- 8*', char(fpp), ...
            ' + (', char(fppp), ')) / ', char(vpa(8*h^3))];
        steps{6} = ['      = ', char(res)];
    
    case 4
        res = vpa((-fnnn+12*fnn-39*fn+56*f-39*fp+12*fpp-fppp)/(6*h^4));
        
        steps{4} = ['f_4th_i = (-f_(i+3) + 12*f_(i+2) - 39*f_(i+1) + ' ...
            '56*f_i - 39*f_(i-1) + 12*f_(i-2) - f_(i-3)) / (6*h^4)'];
        steps{5} = ['      = (-(', char(fnnn), ') + 12*', char(fnn), ...
            ' - 39*', char(fn), ' + 56*', char(f), '- 39*', char(fp), ...
            ' + 12*', char(fpp), ' - (', char(fppp), ')) / ', ...
            char(vpa(6*h^4))];
        steps{6} = ['      = ', char(res)];
    
end

end

