function [pts, steps] = genNewtonRaphson(equations_strs, n, intervals, iter, FPD)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
vars = sym('a%d', [1 n]);
equations = subs(equations_strs);

% generating initial points
initial_points = zeros(1, n);
for i=1:n,
    initial_points(i) = vpa((intervals(i, 1)+intervals(i, 2))/2);
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
points(1, :) = vpa(initial_points);
for i=1:iter,
    tmpD = vpa(eval(subs(D, vars, points(i, :))));
    for j=1:n,
        tmpDj = vpa(eval(subs(Ds(j), vars, points(i, :))));
        points(i+1, j) = vpa(points(i, j)) + vpa(tmpDj/tmpD);
    end
end

pts = vpa(points);

steps = cell(iter+1, 1);
for i=1:iter+1
    steps{i} = ['step ', num2str(i-1), ' -> '];
    for j=1:n
        steps{i} = [steps{i}, char(pts(i, j)), '  '];
    end
end

end