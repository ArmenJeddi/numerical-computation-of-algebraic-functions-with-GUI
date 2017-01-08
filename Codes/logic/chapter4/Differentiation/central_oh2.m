function [steps, res] = central_oh2(F_str, pt, deg, h, FPD)
%CENTRAL_OH2 Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
steps = cell(3, 1);

switch deg
    case 1
        res = vpa((eval(subs(F_str, pt+h))-eval(subs(F_str, pt-h)))/(2*h));
    case 2
        res = vpa((eval(subs(F_str, pt+h))-2*eval(subs(F_str, pt))+...
            eval(subs(F_str, pt-h)))/(h^2));
    case 3
        res = vpa((eval(subs(F_str, pt+2*h))-2*eval(subs(F_str, pt+h))+...
            2*eval(subs(F_str, pt-h))-eval(subs(F_str, pt-2*h)))/(2*h^3));
        
    case 4
        res = vpa((eval(subs(F_str, pt+2*h))-4*eval(subs(F_str, pt+h))+ ...
            6*eval(subs(F_str, pt))-4*eval(subs(F_str, pt-h))+ ...
            eval(subs(F_str, pt-2*h)))/(h^4));
end

end

