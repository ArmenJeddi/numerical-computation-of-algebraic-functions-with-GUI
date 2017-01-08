function [ evalue,evector,valid ] = power_method( A,initial,steps )
    N = size(A) ;
    valid = 1 ;
   if(det(A) ==0  )
       valid = 0 ;
   end
   
   if(initial == zeros(N(1),1))
      valid = 0 ; 
   end
   
   evalue = 0 ;
   evector = zeros(N(1),1) ;
   
   if (valid == 1)
   
   B = A^-1 ;
   evector = A*initial ;
   evector = evector ./ norm(evector) ;
    for k=1:steps
        initial = B * initial ;
        evalue = max(abs(initial)) ;
        initial = initial ./ max(abs(initial)) ;   
    end
    
   end

end

