function [ output , L2 , U2 ] = LU_doolittle( A , b )
    
    N = size(A) ;
    
     valid = 1;
    G = zeros(N(1) , 1) ;
    output = zeros(N(1)+1 , 1) ;
    
	L2 = zeros(N(1),N(1)) ;
	U2 = zeros(N(1),N(1)) ;
	
    if(det(A) == 0)
        valid = 0 ;
    end
    
    if(G == b)
       valid = 0 ; 
    end
    
    if(valid == 1)
    
    L = zeros(N(1) , N(1)) ;
    U = zeros(N(1) , N(1)) ;
    
    for k = 1:N(1)
       L(k,k) = 1 ; 
       U(1,k) = A(1,k) ;
    end
    
    for k = 2:N(1)
       for j = 1:k-1
          sum = 0 ; 
           for i = 1:j - 1
            sum = sum + L(k,i)*U(i,j) ;
           end
           if(U(j,j) == 0)
               L(k,j) = 0 ;
               valid= 0 ;
           else
               L(k,j) = (A(k,j) - sum)/U(j,j) ;
           end
           
       end
       
       for j= k:N(1)
          sum = 0 ; 
           for i = 1:k-1
            sum = sum + L(k,i)*U(i,j) ;
           end
           U(k,j) = A(k,j)  - sum ;
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