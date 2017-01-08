function [output] = strictly_diagonal(A)
    output = true;
    N = size(A) ;
    for k = 1: N(1)
        if (A(k, k) == 0)
            output= false;
            return;
        end
    end
    
    for i = 1: N(1)
        sum = 0;
        for j = 1: N(1)
            if(i ~= j )
				sum = sum + A(i, j);
			end
        end
        if (sum >= A(i, i))
            output = false;
            return;
        end
    end
end
