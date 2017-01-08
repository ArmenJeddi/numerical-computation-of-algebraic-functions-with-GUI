function [ output , L2 , U2 ] = LU_crout( A,b )
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
    L = zeros(N(1) , N(1)) ;
    U = zeros(N(1) , N(1)) ;
    
    for k = 1:N(1)
       U(k,k) = 1 ; 
       L(k,1) = A(k,1) ;
    end
    
    for k = 2:N(1)
       for j = 1:k-1
          sum = 0 ; 
           for i = 1:j - 1
            sum = sum + U(i,k)*L(j,i) ;
           end
           if(L(j,j) == 0)
               U(j,k) = 0 ;
               valid = 0 ;
           else
               U(j,k) = (A(j,k) - sum)/L(j,j) ;
           end
           
       end
       
       for j= k:N(1)
          sum = 0 ; 
           for i = 1:k-1
            sum = sum + U(i,k)*L(j,i) ;
           end
           L(j,k) = A(j,k)  - sum ;
       end
        
    end
    
         Y = linsolve(L,b) ;
    
         X = linsolve(U,Y) ;
    

        for j5 = 1:N(1)
           output(j5,1) = X(j5,1) ;  
        end
		
		L2 = L ;
		U2 = U ;
    
    end
    
    output(N(1)+1,1) = valid ;
    
end

