function [ output , invert ] = invert_index( A,b )

    N = size(A) ;
    valid = 1 ;
    if(det(A) == 0)
        valid = 0 ;
    end
    invert = zeros(N(1) , 1) ;
    output = zeros(N(1) + 1 , 1) ;
    
    if(b == zeros(N(1) , 1))
        valid = 0 ;
    end
    
    if(valid == 1)
    
    B =zeros(N(1),N(1));
    for i = 1:N(1)
        for j=1:N(1) ;
            temp=A;
            temp(i,:)=[];
            temp(:,j)=[];
            B(j,i)=(-1)^(i+j)*det(temp);
        end
    end
    C = B/det(A) ;
    D = C * b ;
    invert = B ;
    for fr = 1 : N(1)
       output(fr,1) = D(fr,1) ;
    end
    
    end
    
    output(N(1) + 1 , 1) = valid ;
end

