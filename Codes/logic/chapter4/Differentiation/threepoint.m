function [steps, res] = threepoint(F_str, pt, h, FPD)
%THREEPOINT Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
steps = cell(3, 1);

res = vpa((-3*eval(subs(F_str, pt))+4*eval(subs(F_str, pt+h))+...
            -eval(subs(F_str, pt+2*h)))/(2*h));

end

