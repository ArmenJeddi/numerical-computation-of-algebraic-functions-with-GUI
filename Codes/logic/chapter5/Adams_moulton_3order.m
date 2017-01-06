function [steps, anss] = Adams_moulton_3order(f, y0, x0, n, h)

    syms x y;
    func = @(xTmp, yTmp) vpa(subs(f, [x y], [xTmp yTmp]));
    out = cell(6*n, 1);
    steps = cell(6*n-12, 1);
    
    x1=vpa(x0+h);
    [tmp, y1]= Runge_kutta_4order(f, y0, x0, 1, h);
    
    x2=vpa(x1+h);
    [tmp, y2]= Runge_kutta_4order(f, y0, x0, 2, h);
    
    origX0=x0;
    
    for i=1:n
        f0 = func(x0, y0);
        out{6*i-5}=f0;
        
        f1 = func(x1, y1);
        out{6*i-4}=f1;
        
        f2 = func(x2, y2);
        out{6*i-3}=f2;
        
        yStar = y2 + (h/12)*(23*f2 - 16*f1 + 5*f0);
        out{6*i-2}=yStar;
        
        y0=y1;
        y1=y2;
        x0=x1;
        x1=x2;
        x2=x2+h;
        
        fStar = func(x2, yStar);
        out{6*i-1}=fStar;
        
        y2 = y2 + (h/12)*(5*fStar + 8*f2 - f1);
        out{6*i-0}=y2;
        
    end
    
    anss = out{6*n-12};
    for i=0:6:6*n-18
        steps{i+1} = ['f0 = ', num2str(double(out{i+1}))];
        steps{i+2} = ['f1 = ', num2str(double(out{i+2}))];
        steps{i+3} = ['f2 = ', num2str(double(out{i+3}))];
        steps{i+4} = ['y* = ', num2str(double(out{i+4}))];
        steps{i+5} = ['f* = ', num2str(double(out{i+5}))];
        steps{i+6} = ['y(', num2str(origX0+h*(i/6+3)), ') = ', num2str(double(out{i+6}))];
    end
    

end