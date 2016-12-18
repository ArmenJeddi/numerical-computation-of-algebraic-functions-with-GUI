function [ output ] = interpolate( X , Y , type , FPD)
    syms x ;
    output = x ;
    n = size(X) ;
    switch(type)
        case 0  %LAGRANGE
            output = Lagrange(X,Y) ;
        case 1 % newton divided differences
            output = NewtonDividedDifferences(X,Y) ;
        case 2
            output = NewtonBackward(X,Y) ;
        case 3
            output = NewtonForward(X,Y) ;
        case 4
            output = NewtonCentral_Backward(X,Y) ;
        case 5
            output = NewtonCentral_Forward(X,Y) ;
    end
    
    l = ceil((X(n)-X(1))/0.01);
    xs = zeros(1,l(1,2));
    xs(1)=X(1);
    i=2;
    while(i<=length(xs))
        xs(i)=xs(i-1)+0.01;
        i=i+1;
    end
    
    output = sym(output) ;
    output = simplify(output);
    output = vpa(output , FPD );
    ys = subs(output,x,xs);
    plot(xs,ys,'g');
    
end

