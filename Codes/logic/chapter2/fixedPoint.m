function [pts, res] = fixedPoint(func_str, initial_x, iter, FPD)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
syms x

func = subs(func_str);
g = subs(func + x);
% disp(g); % test

points = zeros(1, iter+1);
points(1) = vpa(initial_x);
tmp_x = vpa(initial_x);

for i=1:iter,
    tmp_x = vpa(subs(g, tmp_x));
    points(i+1) = tmp_x;
end
res = tmp_x;
pts = vpa(points);

end

