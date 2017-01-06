function [ output_args ] = chapter5core( f, y0, x0, h, xn,mode)
    n = (xn - x0)/h;
    switch mode
        
        case 1
            Taylor
        case 2
            out = Euler(f, y0, x0, n, h)
        case 3
            ModefiedEuler
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

