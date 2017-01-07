function [steps, anss]  = Runge_kutta_4order_2Order(f, g ,x0, y0, z0, h, n)

    syms x y z;
    f = @(xTmp, yTmp, zTmp) vpa(subs(f, [x y z], [xTmp yTmp zTmp]));
    g = @(xTmp, yTmp, zTmp) vpa(subs(g, [x y z], [xTmp yTmp zTmp]));
    
    k1f = @(xTmp, yTmp, zTmp) f(xTmp, yTmp, zTmp);
    k2f = @(xTmp, yTmp, zTmp, k1fTmp, k1gTmp) f(xTmp+h/2, yTmp+k1fTmp*h/2, zTmp+k1gTmp*h/2);
    k3f = @(xTmp, yTmp, zTmp, k2fTmp, k2gTmp) f(xTmp+h/2, yTmp+k2fTmp*h/2, zTmp+k2gTmp*h/2);
    k4f = @(xTmp, yTmp, zTmp, k3fTmp, k3gTmp) f(xTmp+h, yTmp+k3fTmp*h, zTmp+k3gTmp*h);
    
    k1g = @(xTmp, yTmp, zTmp) g(xTmp, yTmp, zTmp);
    k2g = @(xTmp, yTmp, zTmp, k1fTmp, k1gTmp) g(xTmp+h/2, yTmp+k1fTmp*h/2, zTmp+k1gTmp*h/2);
    k3g = @(xTmp, yTmp, zTmp, k2fTmp, k2gTmp) g(xTmp+h/2, yTmp+k2fTmp*h/2, zTmp+k2gTmp*h/2);
    k4g = @(xTmp, yTmp, zTmp, k3fTmp, k3gTmp) g(xTmp+h, yTmp+k3fTmp*h, zTmp+k3gTmp*h);
    
    
    out = cell(10*n, 1);
    steps = cell(10*n, 1);
    anss = cell(2, 1);

    xTmp = x0;
    yTmp = y0;
    zTmp = z0;
    
    for i=1:n
        k1fTmp = k1f(xTmp, yTmp, zTmp);
        k1gTmp = k1g(xTmp, yTmp, zTmp);
        
        k2fTmp = k2f(xTmp, yTmp, zTmp, k1fTmp, k1gTmp);
        k2gTmp = k2g(xTmp, yTmp, zTmp, k1fTmp, k1gTmp);
        
        k3fTmp = k3f(xTmp, yTmp, zTmp, k2fTmp, k2gTmp);
        k3gTmp = k3g(xTmp, yTmp, zTmp, k2fTmp, k2gTmp);
        
        k4fTmp = k4f(xTmp, yTmp, zTmp, k3fTmp, k3gTmp);
        k4gTmp = k4g(xTmp, yTmp, zTmp, k3fTmp, k3gTmp);
        
        xTmp = xTmp+h;
        yTmp = vpa(yTmp + h*(k1fTmp+2*k2fTmp+2*k3fTmp+k4fTmp)/6);
        zTmp = vpa(zTmp + h*(k1gTmp+2*k2gTmp+2*k3gTmp+k4gTmp)/6);
        
        out{10*i-9} = k1fTmp;
        out{10*i-8} = k1gTmp;
        out{10*i-7} = k2fTmp;
        out{10*i-6} = k2gTmp;
        out{10*i-5} = k3fTmp;
        out{10*i-4} = k3gTmp;
        out{10*i-3} = k4fTmp;
        out{10*i-2} = k4gTmp;
        out{10*i-1} = yTmp;
        out{10*i-0} = zTmp;
    end
    
    anss{1} = out{10*n-1};
    anss{2} = out{10*n};
    
    for i=0:10:10*n-10
        steps{i+1} = ['k1f(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+1}))];
        steps{i+2} = ['k1g(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+2}))];
        steps{i+3} = ['k2f(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+3}))];
        steps{i+4} = ['k2g(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+4}))];
        steps{i+5} = ['k3f(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+5}))];
        steps{i+6} = ['k3g(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+6}))];
        steps{i+7} = ['k4f(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+7}))];
        steps{i+8} = ['k4g(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+8}))];
        steps{i+9} = ['y(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+9}))];
        steps{i+10} = ['z(', char(vpa(x0+h*(i/10+1))), ') = ', char(vpa(out{i+10}))];
        
    end
end

