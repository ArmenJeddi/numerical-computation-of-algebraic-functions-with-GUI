function [steps, anss] = Euler(f, y0, x0, n, h)
    syms x y;
    out = cell(floor(n+1), 1);
    steps = cell(floor(n+1), 1);
    n
    out{1} = y0;
    for i=1:n
        out{i+1} = out{i}+h*subs(f, [x y], [x0+h*i out{i}]);
    end
    anss = out{i+1};
%     num2str(out{1})
%     num2str(x0+h*(2))
    for i=1:n+1
        steps{i} = ['y(', num2str(x0+h*(i-1)), ') = ', num2str(double(out{i}))];
    end
    
end

