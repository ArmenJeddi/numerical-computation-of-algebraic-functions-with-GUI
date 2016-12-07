function [res] = genNewtonRaphson(equations_strs, n, intervals, iter)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

vars = sym('a%d', [1 n]);
equations = subs(equations_strs);

% generating initial points
initial_points = zeros(1, n);
for i=1:n,
    initial_points(i) = (intervals(i, 1)+intervals(i, 2))/2;
end

D_mat = sym(zeros(n, n));
Ds_mats = sym(zeros(n, n, n));
Ds = sym(zeros(n, 1));

for i=1:n,
    for j=1:n,
        D_mat(i, j) = diff(equations(i), vars(j));
    end
end
% disp(D_mat); % test
D = det(D_mat);
% disp(D); % test

negCol = -equations;
for i=1:n,
    tmpD = D_mat;
    tmpD(:, i) = negCol;
    Ds_mats(:, :, i) = tmpD;
    % disp(Ds_mats(:, :, i)); % test
    Ds(i) = det(tmpD);
    % disp(Ds(i)); % test
end


points = zeros(iter+1, n);
points(1, :) = initial_points;
for i=1:iter,
    tmpD = eval(subs(D, vars, points(i, :)));
    for j=1:n,
        tmpDj = eval(subs(Ds(j), vars, points(i, :)));
        points(i+1, j) = points(i, j) + tmpDj/tmpD;
    end
end

% disp(points); % test
res = points;
end