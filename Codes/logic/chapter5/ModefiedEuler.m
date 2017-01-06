function [steps, anss] = ModefiedEuler(f, y0, x0, n, h)
     
    syms x y;
    f = @(xTmp, yTmp) vpa(subs(f, [x, y], [xTmp yTmp]));
    out = cell(2*n+1, 1);
    steps = cell(2*n+1, 1);
    n
    
    xTmp = vpa(x0);
    yTmp = vpa(y0);
    out{1} = yTmp;
    for i=1:n
        yStar = vpa(yTmp + h*f(xTmp, yTmp));
        yTmp = vpa(yTmp + (h/2)*(f(xTmp, yTmp) + f(xTmp, yStar)));
        xTmp = vpa(xTmp+h);
        out{2*i} = yStar;
        out{2*i+1} = yTmp;
    end
    
    anss = out{2*n+1};
    
    steps{1} = ['y(', num2str(x0), ') = ', num2str(double(y0))];
    for i=2:2:2*n
        steps{i} = ['y*(', num2str(x0+h*(i/2)), ') = ', num2str(double(out{i}))];
        steps{i+1} = ['y(', num2str(x0+h*(i/2)), ') = ', num2str(double(out{i+1}))];
    end

end

