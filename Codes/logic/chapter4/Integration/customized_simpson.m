function [steps, res, errdlg] = customized_simpson(F_str, intvl, h, FPD)
%CUSTOMIZED_SIMPSON Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);

s = intvl(1);
e = intvl(2);

n = int64((e-s)/h);
steps = {'To minimize the total error we assign the';
         'longest possible interval to Simpson 1/3.'; ''};

if n <= 1
    errdlg = ['Error: Few points to calculate!', ...
            ' At least 3 points must exist.'];
    res = 0;
    return
end

if mod(n, 2) == 0
    [steps1, res, errdlg] = ...
        simpson('one third', F_str, intvl, h, FPD);
    steps = [steps; ['Since n is even here (n=', num2str(n), ...
        ') we only use Simpson 1/3 here']; ''; steps1];
else
    intvl1 = [s, e-3*h];
    [steps1, res1, errdlg1] = ...
        simpson('one third', F_str, intvl1, h, FPD);
    
    steps = [steps; ['Assigning interval [', num2str(s), ', ', ...
        num2str(e-3*h), '] to Simpson 1/3 method']; steps1];
    
    intvl2 = [e-3*h, e];
    [steps2, res2, errdlg2] = ...
        simpson('three eighths', F_str, intvl2, h, FPD);
    
    steps = [steps; ' '; ['Assigning interval [', num2str(e-3*h), ', ', ...
        num2str(e), '] to Simpson 3/8 method.'];
        '(Actually only the last 4 points are assigned to this method)';
        steps2; ' '];
    
    res = vpa(res1+res2);
    steps3 = ['Adding up the results:'; {' '}; ['Final answer = ', ...
        char(vpa(res1)), ' + ', char(vpa(res2))];
        ['             = ', char(res)]];
    
    steps = [steps; steps3];
    if strcmp(errdlg1, 'none') && strcmp(errdlg2, 'none')
        errdlg = 'none';
    else
        errdlg = [errdlg1, errdlg2];
    end
end

end

