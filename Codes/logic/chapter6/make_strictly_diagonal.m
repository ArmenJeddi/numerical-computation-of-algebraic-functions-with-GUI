function [A2, b2] = make_strictly_diagonal(A, b)
    N = size(A);
    A2 = A ;
    b2 = b ;
    if (strictly_diagonal(A))
        return;
    end
    i = 1;
    k = 1;
    pivots = zeros(N(1),N(1));
    while (i <= N(1) && k <= N(1))
        if (A2(i, k) == 0)
            for j = i + 1: N(1)
                if (A2(j, k) ~= 0)
                    temp = A2(i, :);
                    A2(i, :) = A2(j, :);
                    A2(j, :) = temp;
                    temp2 = b2(i, 1);
                    b2(i, 1) = b2(j, 1);
                    b2(j, 1) = temp2;
                    break;
                end
            end
        end
        if (strictly_diagonal(A2))
            return;
        end
        if (A2(i, k) ~= 0)
            pivots(i, k) = 1;
            for j = i + 1: N(1)
                tmp = A2(j, k);
                A2(j, :) = A2(j, :) - (A2(j, k) / A2(i, k)) .* A2(i, :);
                b2(j, 1) = b2(j, 1) - (tmp / A2(i, k)) * b2(i, 1);
                if (strictly_diagonal(A2))
                    return;
                end
            end
            i = i + 1;
            k = k + 1;
        else
            k = k + 1;
        end
    end
    i = N(1);
    k = N(1);
    while (i >= 1 && k >= 1)
        if (pivots(i, k) == 1)
            tmp = A2(i, k);
            A2(i, :) = A2(i, :) ./ A2(i, k);
            b2(i, 1) = b2(i, 1) ./ tmp;
            for j = i - 1: -1: 1
                tmp = A2(j, k);
                A2(j, :) = A2(j, :) - A2(j, k) .* A2(i, :);
                b2(j, 1) = b2(j, 1) - tmp * b2(i, 1);
                if (strictly_diagonal(A2))
                    return;
                end
            end
            i = i - 1;
            k = k - 1;
        else
            k = k - 1;
        end
    end
end

