function [pts, res] = fixedPoint(func_str, initial_x, iter)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

syms x

func = subs(func_str);
g = subs(func + x);
disp(g);

points = zeros(1, iter+1);
points(1) = initial_x;
tmp_x = initial_x;

for i=1:iter,
    tmp_x = subs(g, tmp_x);
    points(i+1) = tmp_x;
end
res = tmp_x;
pts = points;

end

