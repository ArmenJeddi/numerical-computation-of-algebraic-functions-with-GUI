function [steps, anss] = Euler(f, y0, x0, n, h)
   
    syms x y;
    out = cell(n+1, 1);
    steps = cell(n+1, 1);
    out{1} = y0;
    for i=1:n
        xTmp = vpa(x0+h*i);
        yTmp = vpa(out{i});
        out{i+1} = vpa(out{i}+h*subs(f, [x y], [xTmp yTmp]));
    end
    anss = out{n+1};
    for i=1:n+1
        steps{i} = ['y(', char(vpa(x0+h*(i-1))), ') = ', char(vpa(out{i}))];
    end
    
end

