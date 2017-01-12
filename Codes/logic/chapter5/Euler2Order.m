function [steps, anss] = Euler2Order(f, g ,x0, y0, z0, h, n)

    syms x y z;
    f = @(x0, y0, z0)  GRounder(subs(f, [x y z], [x0 y0 z0]));
    g = @(x0, y0, z0)  GRounder(subs(g, [x y z], [x0 y0 z0]));
    out = cell(2*n, 1);
    steps = cell(2*n, 1);
    anss = cell(2, 1);
    origX0 = x0;
   
    for i=1:n
        yTmp = y0;
        zTmp = z0;
        xTmp = x0;
        x0 = x0+h;
        y0 = GRounder(yTmp+h*f(xTmp, yTmp, zTmp));
        z0 = GRounder(zTmp+h*g(xTmp, yTmp, zTmp));
        
        out{2*i-1} = y0;
        out{2*i} = z0;
        
    end
    
    
    anss{1} = out{2*n-1};
    anss{2} = out{2*n};
    for i=0:2:2*n-2
        steps{i+1} = ['y(', char(GRounder(origX0+h*(i/2+1))), ') = ', char(GRounder(out{i+1}))];
        steps{i+2} = ['z(', char(GRounder(origX0+h*(i/2+1))), ') = ', char(GRounder(out{i+2}))];
    end
end

