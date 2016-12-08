function [ output ] = calc( f , y )
    syms x ;
    output = subs(f , x , y) ;
    disp(output) ;

end

