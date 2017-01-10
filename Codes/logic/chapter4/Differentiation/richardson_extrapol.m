function [steps, res] = richardson_extrapol(h, gh2, gh1, err_order, FPD)
%RICHARDSON_EXTRAPOL Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
steps = cell(9, 1);

res = vpa((2^err_order*gh2 - gh1)/(2^err_order-1));

steps{1} = 'Richardson Extrapolation : ';
steps{2} = '';
steps{3} = ['h1 = ', char(vpa(h)), '  , h2 = ', char(vpa(h/2))];
steps{4} = ['Order of error: p = ', num2str(err_order)];
steps{5} = '';
steps{6} = 'G = (2^p * g(h2) - g(h1)) / (2^p - 1)';
steps{7} = ['  = (2^', num2str(err_order), ' * g(', ...
    char(vpa(h/2)), ') - g(', char(vpa(h)), ')) / (2^', ...
    num2str(err_order), ' - 1)'];
steps{8} = ['  = (', num2str(2^err_order), ' * ', ...
    char(vpa(gh2)), ' - ', char(vpa(gh1)), ') / (', ...
    num2str(2^err_order), ' - 1)'];
steps{9} = ['  = ', char(vpa(res))];
    

end

