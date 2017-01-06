function [steps, anss] = chapter5core( f, y0, x0, h, xn,mode, FPD)
    digits(FPD);
    n = round((xn - x0)/h);
    switch mode
        
        case 1
            Taylor
        case 2
            [steps, anss] = Euler(f, y0, x0, n, h);
        case 3
            [steps, anss] = ModefiedEuler(f, y0, x0, n, h);
        case 4
            Runge_kutta_mid_point
        case 5
            Runge_kutta_3order
        case 6
            Runge_kutta_4order
        case 7
            Adams_moulton
        case 8
            Euler_2nd
        case 9
            Runge_kutta_2nd_4order
        
        
    end
end

