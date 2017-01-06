function out = Euler(f, y0, x0, n, h)
    syms x y;
    n
    out = ones(floor(n+1), 1);
    out(1) = y0;
    for i=1:n
        out(i+1) = out(i)+h*subs(f, [x y], [x0+h*i out(i)]);
    end
end

