function [ output ] = NewtonDividedDifferences( X , Y )
    %X= [.1,.2,.3,.4,.5] ;
    %Y = [1.4 , 1.56 , 1.76 , 2 , 2.28] ;
    N = size(X) ;
    A = zeros(N(2) , N(2)) ;
    
    for k = 1:N(2)
       A(k,1) = Y(k) ;
    end
    
    for k = 2:N(2)
        for j = k:N(2)
           A(j , k) = (A(j , k - 1) - A(j-1 , k-1) )/(X(j) - X(j-k+1)) ;
        end
    end
    
    output = num2str(Y(1)) ;
    for k = 2:N(2)
        for j = 1 : k-1
            if(j == 1)
                temp = strcat('(x-' , num2str(X(1)),')') ;
            else
                temp = strcat(temp ,'*(x-' , num2str(X(j)),')') ;
            end
        end
        if(A(k,k) > 0.00001 || A(k,k) < -0.00001 )
            output = strcat(output , '+' , num2str(A(k,k)), '*' , temp ) ;
        end
    end
    output = sym(output) ;
end

