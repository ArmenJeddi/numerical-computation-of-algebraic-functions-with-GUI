function [ output , valid] = cramer( A , B )
    N = size(A) ;
    
    valid = 1;
    L = zeros(N(1) , 1) ;
    output = zeros(N(1)+1 , 1) ;
    
    if(det(A) == 0)
        valid = 0 ;
    end
    
    if(L == B)
       valid = 0 ; 
    end
    
    output(N(1)+1,1) = valid ;
    
    if(valid == 1)
    X = zeros(N(1),1) ;
    for k=1:N(1)
        C = A ;
        for j = 1 : N(1)
            C(j , k) = B(j , 1) ;
        end
        X(k,1) = det(C)/det(A) ;
    end
    for z=1:N(1)
        output(z,1) = X(z,1) ;
    end
    end
end