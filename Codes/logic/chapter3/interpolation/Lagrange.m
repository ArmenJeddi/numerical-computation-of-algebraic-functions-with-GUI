function [ output ] = Lagrange( X , Y ) 
    N = size(X) ;
  
    for k = 1:N(2)
        soorat = '' ;
        makhraj = 1 ;
        for j = 1:N(2)
            if(j ~= k)
                soorat = strcat(soorat , '*' , '(x-' , num2str(X(j)) , ')') ; 
                makhraj = makhraj * (X(k) - X(j)) ;
            end
        end
        
        temp = strcat(soorat, '/' , num2str(makhraj)) ;
        if(Y(k) ~= 0)
        if(k==1)
           output = strcat(num2str(Y(1)) , temp) ;
        else
            output = strcat(output , ' +', num2str(Y(k)),temp ) ;
        end
        end
        
    end
    output = sym(output) ;
end