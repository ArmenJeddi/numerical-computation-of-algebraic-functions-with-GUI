function [steps, anss] = chapter5core2Order( f, g ,x0, y0, z0, h, xn, mode, FPD)
    warning off;
    digits(FPD);
    n = round((xn - x0)/h);
    
    switch mode
        case 1
            [steps, anss] = Euler2Order(f, g ,x0, y0, z0, h, n);            
        case 2
            [steps, anss] =  Runge_kutta_4order_2Order(f, g ,x0, y0, z0, h, n); 
            
            
    end
    
end

