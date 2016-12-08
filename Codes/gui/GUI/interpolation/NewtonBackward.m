function [ output ] = NewtonBackward( X , Y )

    N = size(X) ;
    
    for k = 1:N(2)
       A(k,1) = Y(k) ;
    end
    
    for k = 2:N(2)
        for j = k:N(2)
            A(j , k) = (A(j , k - 1) - A(j-1 , k-1) ) ;
        end
    end
    
    output = num2str(Y(N(2))) ;
    h = X(2) - X(1) ;
 
    for k = 2:N(2)
        for j = 1 : k-1
            if(j == 1)
                temp = strcat('(x - ' , num2str(X(N(2))) , ')' , '/' , num2str(h)) ;
            else
                temp = strcat(temp ,'*(' , '(x - ' , num2str(X(N(2))) , ')/' , num2str(h) , '+', num2str(j-1),')/' , num2str(factorial(j))) ;
            end
        end
        if(A(N(2),k) > 0.00001 || A(N(2),k) < -0.00001 )
            output = strcat(output , '+' , num2str(A(N(2),k)), '*' , temp ) ;
        end
    end
    output = sym(output) ;
    
end

