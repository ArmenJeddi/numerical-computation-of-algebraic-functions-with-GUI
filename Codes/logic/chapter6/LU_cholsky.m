function [ output, L2 , U2 ] = LU_cholsky( A,b )
     N = size(A) ;
     valid = 1;
    G = zeros(N(1) , 1) ;
    output = zeros(N(1)+1 , 1) ;
    
    if(det(A) == 0)
        valid = 0 ;
    end
        L2 = zeros(N(1),N(1)) ;
	U2 = zeros(N(1),N(1)) ;
    if(G == b)
       valid = 0 ; 
    end
    
    if(valid == 1)
    H = A.' * A ;
    
    B2 = A.' * b ;
    
    L = zeros(N(1) , N(1)) ;
    
    for k = 1:N(1)
        sum = 0 ;
        
        for j = 1:k-1
            sum = sum +  L(k,j)*L(k,j) ;
           % disp(L(k,j));
        end
        
        if(H(k,k)-sum < 0)
           valid = 0 ; 
        end
        L(k,k) = sqrt(H(k,k)-sum) ;
        
       % disp(L(k,k)) ;
        
        for j1 = k+1:N(1)
            sum = 0 ;
            for j2 = 1:k-1
               sum = sum + L(k,j2)*L(j1,j2) ; 
            end
           % disp(sum) ;
           if(L(k,k) == 0)
               L(j1,k) = 0 ;
               valid = 0 ;
           else
            L(j1,k) = (H(k,j1) - sum)/L(k,k) ;
           end
        end
           %disp(L) ;
    end
    U = L.' ;
    
    Y = linsolve(L,B2) ;
    
         X = linsolve(U,Y) ;
        % disp(H) ;

        for j5 = 1:N(1)
           output(j5,1) = X(j5,1) ;  
        end
		
		L2 = L ;
		U2 = U ;
    
    end
    
    output(N(1)+1,1) = valid ;
    
end