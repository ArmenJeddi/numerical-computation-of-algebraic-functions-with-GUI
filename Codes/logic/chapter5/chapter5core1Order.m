function [steps, anss] = chapter5core1Order( f, y0, x0, h, xn, mode, nForTaylor, FPD)
    digits(FPD);
    n = round((xn - x0)/h);
    switch mode
        
        case 1
             [steps, anss] = Taylor(f, y0, x0, n, h, nForTaylor);
        case 2
            [steps, anss] = Euler(f, y0, x0, n, h);
        case 3
            [steps, anss] = ModefiedEuler(f, y0, x0, n, h);
        case 4
%             Runge_kutta_mid_point:
            [steps, anss] = ModefiedEuler(f, y0, x0, n, h);
        case 5
            [steps, anss] = Runge_kutta_3order(f, y0, x0, n, h);
        case 6
            [steps, anss] = Runge_kutta_4order(f, y0, x0, n, h);
        case 7
            [steps, anss] = Adams_moulton_3order(f, y0, x0, n, h);
        case 8
%             TODO
            [steps, anss] = Adams_moulton(f, y0, x0, n, h);

    end
end

