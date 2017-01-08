function [ output] = Jacobi( A , b , initial, steps )
    N = size(A);
    output = zeros(N(1)+1,1) ;
    
    valid = 1 ;
    if(det(A) == 0)
        valid =1 ;
    end
    if(b == zeros(N(1),1))
       valid = 0 ; 
    end
    
    if(valid == 1)
    
    [A2,B2] = make_strictly_diagonal(A, b); 
    
    next = zeros(N(1),1) ;
    
    for j2 = 1:steps
    for i = 1: N(1)
        sum = 0;
        for j = 1: N(1)
            if (j ~= i)
                sum = sum + A2(i, j) * initial(j, 1);
            end
            
        end
        next(i, 1) = (B2(i, 1) - sum) / A2(i, i);
    end    
        initial = next ;
    end
    
        for k = 1:N(1)
           output(k,1) = next(k,1) ; 
        end
    
    end
    
    output(N(1)+1,1) = valid;

end