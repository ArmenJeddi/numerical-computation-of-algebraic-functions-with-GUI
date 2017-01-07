function [steps, anss] = Taylor(f, y0, x0, n, h, nForTaylor)

    syms x y;
    func = @(xTmp, yTmp) vpa(subs(f, [x y], [xTmp yTmp]));
    out = cell(n*(nForTaylor+1), 1);
    steps = cell(n*(nForTaylor+1), 1);
    origX0 = x0;
    
    sum=y0;
    for i=1:n
        d=sym('y(x)');
        out{(i-1)*(nForTaylor+1)+1}=func(x0, y0);
        sum=vpa(sum+h*func(x0, y0));
        df=diff(subs(f,'y','y(x)'));
        for j=2:nForTaylor 
            d = diff(d);
            tmpStat=vpa(subs(df,{'x' 'y' char(d)},{x0 y0 out{(i-1)*(nForTaylor+1)+j-1}}));
            out{(i-1)*(nForTaylor+1)+j} = tmpStat;
            df=diff(subs(df));
            sum = vpa(sum + (h^j)*tmpStat/factorial(j));
        end
        out{i*(nForTaylor+1)} = sum;
        y0 = sum;
        x0 = x0+h;
    
    end

    anss = out{n*(nForTaylor+1)};
    for i=1:n
        for j = 1:nForTaylor
        steps{(i-1)*(nForTaylor+1)+j} = ['y^(', num2str(j), ') = ', num2str(double(out{(i-1)*(nForTaylor+1)+j}))];
        end
        steps{i*(nForTaylor+1)} = ['y(' ,num2str(origX0+h*(i)) ,') = ', num2str(double(out{i*(nForTaylor+1)}))];
    end
    

end
