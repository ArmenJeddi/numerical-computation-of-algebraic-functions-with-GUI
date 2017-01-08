function [ output,matrice1] = Gauss(A,B)
    N = size(A) ;
    output = zeros(N(1)+1 , 1) ;
    S = zeros(N(1),N(1)+1) ;
    valid = 1 ;
    if(det(A) == 0 )
       valid = 0 ; 
    end
    matrice1 = zeros(N(1) , N(1) + 1) ; 
    if(B == zeros(N(1),1) )
       valid = 0 ; 
    end
    
    if(valid == 1)
    
    for k=1:N(1)
       for j=1:N(1) 
            S(k,j) = A(k,j) ;
       end
       S(k,N(1)+1) = B(k) ;
    end
    
    for k= 1:N(1) -1
        C = caller(S,k) ;
        for j2 = k+1:N(1)
           sum = C(j2,k) / C(k,k) ; 
           
           C(j2,k) = 0 ;
           for j3 = k+1:N(1)+1
              C(j2,j3)  = C(j2,j3) - sum*C(k,j3) ;
           end
        end
        S = C ;
    end
    
    for k = N(1):-1: 2
        for j4 = k-1:-1:1
           sum = S(j4,k) / S(k,k) ; 
            S(j4,k) = 0 ;
            S(j4,N(1)+1) = S(j4,N(1)+1) - sum * S(k,N(1)+1) ;
        end
        
    end
    
    for k = 1 : N(1)
        output(k,1) = S(k,N(1)+1)/S(k,k) ;
    end
    matrice1 = S ;
    end
    
    output(N(1)+1 , 1) = valid ;
end

function [out] = caller(A,k)
    N = size(A) ;
    if(A(k,k) == 0)
       for j = k+1:N(1)
          if(A(j,j) ~= 0)
              l = j ;
          end
       end
       
       for j1 = 1:N(1)+1
           swap = A(k , j1) ;
           A(k,j1) = A(l,j1) ;
           A(l,j1) = swap ;
       end
       
       
    end
    out = A ;
end

