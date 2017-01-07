function [steps, anss] = Runge_kutta_3order(f, y0, x0, n, h)

    syms x y;
    func = @(xTmp, yTmp) vpa(subs(f, [x y], [xTmp yTmp]));
    k1 = @(xTmp, yTmp) vpa(h*func(xTmp, yTmp));
    k2 = @(xTmp, yTmp, k1Tmp) vpa(h*func(xTmp+h/2, yTmp+k1Tmp/2));
    k3 = @(xTmp, yTmp, k1Tmp, k2Tmp) vpa(h*func(xTmp+h, yTmp+2*k2Tmp-k1Tmp));
    out = cell(4*n, 1);
    steps = cell(4*n, 1);

    xTmp = x0;
    yTmp = y0;
    for i=1:n
        k1Tmp = k1(xTmp, yTmp);
        k2Tmp = k2(xTmp, yTmp, k1Tmp);
        k3Tmp = k3(xTmp, yTmp, k1Tmp, k2Tmp);
        yTmp = vpa(yTmp + (k1Tmp+4*k2Tmp+k3Tmp)/6);
        xTmp = xTmp+h;
        out{4*i-3} = k1Tmp;
        out{4*i-2} = k2Tmp;
        out{4*i-1} = k3Tmp;
        out{4*i-0} = yTmp;
    end
    
    anss = out{4*n};
    
    for i=0:4:4*n-4
        steps{i+1} = ['k1(', char(vpa(x0+h*(i/4+1))), ') = ', char(vpa(out{i+1}))];
        steps{i+2} = ['k2(', char(vpa(x0+h*(i/4+1))), ') = ', char(vpa(out{i+2}))];
        steps{i+3} = ['k3(', char(vpa(x0+h*(i/4+1))), ') = ', char(vpa(out{i+3}))];
        steps{i+4} = ['y(', char(vpa(x0+h*(i/4+1))), ') = ', char(vpa(out{i+4}))];
    end

end

