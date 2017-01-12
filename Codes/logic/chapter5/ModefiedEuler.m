function [steps, anss] = ModefiedEuler(f, y0, x0, n, h)
     
    syms x y;
    f = @(xTmp, yTmp) GRounder(subs(f, [x, y], [xTmp yTmp]));
    out = cell(2*n+1, 1);
    steps = cell(2*n+1, 1);
    
    xTmp = GRounder(x0);
    yTmp = GRounder(y0);
    out{1} = yTmp;
    for i=1:n
        yStar = GRounder(yTmp + h*f(xTmp, yTmp));
        yTmp = GRounder(yTmp + (h/2)*(f(xTmp, yTmp) + f(xTmp, yStar)));
        xTmp = GRounder(xTmp+h);
        out{2*i} = yStar;
        out{2*i+1} = yTmp;
    end
    
    anss = out{2*n+1};
    
    steps{1} = ['y(', char(GRounder((x0))), ') = ', char(GRounder(y0))];
    for i=2:2:2*n
        steps{i} = ['y*(', char(GRounder(x0+h*(i/2))), ') = ', char(GRounder(out{i}))];
        steps{i+1} = ['y(', char(GRounder(x0+h*(i/2))), ') = ', char(GRounder(out{i+1}))];
    end

end

