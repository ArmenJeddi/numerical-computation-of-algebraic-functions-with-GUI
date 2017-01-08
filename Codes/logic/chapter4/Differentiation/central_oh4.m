function [steps, res] = central_oh4(F_str, pt, deg, h, FPD)
%CENTRAL_OH4 Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
steps = cell(3, 1);

switch deg
    case 1
        res = vpa((-eval(subs(F_str, pt+2*h))+8*eval(subs(F_str, pt+h))-...
            8*eval(subs(F_str, pt-h))+eval(subs(F_str, pt-2*h)))/(12*h));
    case 2
        res = vpa((-eval(subs(F_str, pt+2*h))+16*eval(subs(F_str, pt+h))-...
            30*eval(subs(F_str, pt))+16*eval(subs(F_str, pt-h))-...
            eval(subs(F_str, pt-2*h)))/(12*h^2));
    case 3
        res = vpa((-eval(subs(F_str, pt+3*h))+8*eval(subs(F_str, pt+2*h))-...
            13*eval(subs(F_str, pt+h))+13*eval(subs(F_str, pt-h))-...
            8*eval(subs(F_str, pt-2*h)))/(8*h^3));
    case 4
        res = vpa((-eval(subs(F_str, pt+3*h))+12*eval(subs(F_str, pt+2*h))-...
            39*eval(subs(F_str, pt+h))+56*eval(subs(F_str, pt))-...
            39*eval(subs(F_str, pt-h))+...
            12*eval(subs(F_str, pt-2*h)))/(6*h^4));
end

end

