function [ output ] = curve_not_given( X , Y )
    
    n = size(X)  ;
    %for polynomial of degree 3
    S_x_1 = sum(X) ;
    S_x_2 = sum(X .^ 2) ;
    S_x_3 = sum(X .^ 3) ;
    S_x_4 = sum(X .^ 4) ;
    S_x_5 = sum(X .^ 5) ;
    S_x_6 = sum(X .^ 6) ;
    S_y = sum(Y) ;
    S_x_1_y_1 = sum(X .* Y) ;
    S_x_2_y = sum( (X .^2 ) .* Y ) ;
    S_x_3_y = sum( (X .^3 ) .* Y ) ;
    A1 = linsolve([n(1) , S_x_1 , S_x_2 , S_x_3 ; S_x_1 , S_x_2 , S_x_3 , S_x_4 ; S_x_2 , S_x_3 , S_x_4 , S_x_5 ;S_x_3 , S_x_4 , S_x_5 , S_x_6] , [S_y ; S_x_1_y_1 ; S_x_2_y ; S_x_3_y] );
    
    % for y = 1/(ax + b) --> Y = a1X + a0 
    S_y_1 = sum(1 ./ Y) ;
    S_x_1_y_2 = sum(X .* (1 ./ Y)) ;
    A2 = linsolve([n(1) , S_x_1 ; S_x_1 , S_x_2 ] , [S_y_1 ; S_x_1_y_2] );
    
    % for y = a cos(x) + b --> y = a1X + a0 
    X3 = cos(X) ;
    S_X3 = sum(X3) ;
    S_X3_2 = sum(X3 .^ 2) ;
    S_X3Y = sum(X3 .* Y) ;
    A3 = linsolve([n(1) , S_X3 ; S_X3 , S_X3_2 ] , [ S_y ; S_X3Y ]);
    
    %for y = a * tanh(x) + b --> Y = a1X + a0
    
    X4 = tanh(X) ;
    S_X4 = sum(X4) ;
    S_X4_2 = sum(X4 .^ 2) ;
    S_X4Y = sum(X4 .* Y) ;
    A4 = linsolve([n(1) , S_X4 ; S_X4 , S_X4_2 ] , [ S_y ; S_X4Y ]);
    
    %for y = a ln(x) + b 
    X5 = log(X) ;
    S_X5 = sum(X5) ;
    S_X5_2 = sum(X5 .^ 2) ;
    S_X5Y = sum(X5 .* Y ) ;    
    A5 = linsolve([n(1) , S_X5 ; S_X5 , S_X5_2 ] , [ S_y ; S_X5Y ]);
    
    %for y = a * coth(x) + b --> Y = a1X + a0
    X6 = coth(X) ;
    S_X6 = sum(X6) ;
    S_X6_2 = sum(X6 .^ 2) ;
    S_X6Y = sum(X6 .* Y) ;
    A6 = linsolve([n(1) , S_X6 ; S_X6 , S_X6_2 ] , [ S_y ; S_X6Y ]);
    
    %for y = a * sinh(x) + b --> Y = a1X + a0
    X7 = sinh(X) ;
    S_X7 = sum(X7) ;
    S_X7_2 = sum(X7 .^ 2) ;
    S_X7Y = sum(X7 .* Y) ;
    A7 = linsolve([n(1) , S_X7 ; S_X7 , S_X7_2 ] , [ S_y ; S_X7Y ]);
    
    %for y = a * cosh(x) + b --> Y = a1X + a0
    X8 = cosh(X) ;
    S_X8 = sum(X8) ;
    S_X8_2 = sum(X8 .^ 2) ;
    S_X8Y = sum(X8 .* Y) ;
    A8 = linsolve([n(1) , S_X8 ; S_X8 , S_X8_2 ] , [ S_y ; S_X8Y ]);
    
    %for y = a * sin(x) + b --> Y = a1X + a0
    X9 = sin(X) ;
    S_X9 = sum(X9) ;
    S_X9_2 = sum(X9 .^ 2) ;
    S_X9Y = sum(X9 .* Y) ;
    A9 = linsolve([n(1) , S_X9 ; S_X9 , S_X9_2 ] , [ S_y ; S_X9Y ]);
    
    %for y = a * tan(x) + b --> Y = a1X + a0
    X10 = tan(X) ;
    S_X10 = sum(X10) ;
    S_X10_2 = sum(X10 .^ 2) ;
    S_X10Y = sum(X10 .* Y) ;
    A10 = linsolve([n(1) , S_X10 ; S_X10 , S_X10_2 ] , [ S_y ; S_X10Y ]);
    
    %for y = a * cot(x) + b --> Y = a1X + a0
    X11 = cot(X) ;
    S_X11 = sum(X11) ;
    S_X11_2 = sum(X11 .^ 2) ;
    S_X11Y = sum(X11 .* Y) ;
    A11 = linsolve([n(1) , S_X11 ; S_X11 , S_X11_2 ] , [ S_y ; S_X11Y ]);
    
    %for y = a *exp(bx) --> Y = a1X + a0,   a1 = b , Y = log(y),a0 =log(a)
    X12 = X ;
    S_X12 = sum(X12);
    S_X12_2 = sum(X12 .^ 2);
    Y12 = log(Y) ;
    S_Y12 = sum(Y12) ;
    S_X12Y = sum(X12 .* Y12) ;
    A12 = linsolve([n(1) , S_X12 ; S_X12 , S_X12_2 ] , [ S_Y12 ; S_X12Y ]);
    alpha = exp(A12(1)) ;
    % finding RMS of the functions --> we have the fitting curves , so we
    % only calculate the values
    
    RMS = ones(1,12);
    
    sum_v = 0 ;
    for i = 1:n(1)
        sum_v = sum_v + (Y(i) - (A1(1) + X(i) * A1(2) + X(i)^2 * A1(3) + X(i)^3 * A1(4) ))^2 ;
    end
    RMS(1) = sqrt(sum_v/n(1));
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) - 1/( A2(1) + X(i) * A2(2) ))^2 ;
    end
    RMS(2) = sqrt(sum_v/n(1)) ;
    
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + (Y(i) - (A3(1) + cos(X(i)) * A3(2)))^2 ;
    end
    RMS(3) = sqrt(sum_v/n(1)) ;
    
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( A4(1) + tanh(X(i)) * A4(2) ))^2 ;
    end
    RMS(4) = sqrt(sum_v/n(1)) ;
    
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( A5(1) + log(X(i)) * A5(2) ))^2 ;
    end
    RMS(5) = sqrt(sum_v/n(1)) ;
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( A6(1) + coth(X(i)) * A6(2) ))^2 ;
    end
    RMS(6) = sqrt(sum_v/n(1)) ;
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( A7(1) + sinh(X(i)) * A7(2) ))^2 ;
    end
    RMS(7) = sqrt(sum_v/n(1)) ;
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( A8(1) + cosh(X(i)) * A8(2) ))^2 ;
    end
    RMS(8) = sqrt(sum_v/n(1)) ;
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( A9(1) + sin(X(i)) * A9(2) ))^2 ;
    end
    RMS(9) = sqrt(sum_v/n(1)) ;
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( A10(1) + tan(X(i)) * A10(2) ))^2 ;
    end
    RMS(10) = sqrt(sum_v/n(1)) ;
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( A11(1) + cot(X(i)) * A11(2) ))^2 ;
    end
    RMS(11) = sqrt(sum_v/n(1)) ;
    
    sum_v = 0 ;
    for i = 1:n(1)
       sum_v = sum_v + ( Y(i) -( alpha * exp(A12(2)*X(i)) ))^2 ;
    end
    RMS(12) = sqrt(sum_v/n(1)) ;
    
    
    RMS_min = min(RMS);

    if RMS_min == RMS(1)
        output = strcat('(', num2str(A1(4)) ,'*x^3) + ' , '(', num2str(A1(3)) ,'*x^2) + ' , '(', num2str(A1(2)) ,'*x) + ' , '(',num2str(A1(1)),')') ;
    elseif RMS_min == RMS(2)
        output = strcat('1/(',num2str(A2(2)),'*x+' , num2str(A2(1)) , ')' ) ;
    elseif RMS_min == RMS(3)
        output = strcat( num2str(A3(2)) , '*cos(x) + ' , num2str(A3(1)) ) ;
    elseif RMS_min == RMS(4)
        output = strcat(num2str(A4(2)) , '*tanh(x) + ' , num2str(A4(1))) ;
    elseif RMS_min == RMS(5)
        output = strcat(num2str(A5(2)) , '*log(x) + ' , num2str(A5(1))) ;
    elseif RMS_min == RMS(6)
        output = strcat(num2str(A6(2)) , '*coth(x) + ' , num2str(A6(1))) ;
    elseif RMS_min == RMS(7)
        output = strcat(num2str(A7(2)) , '*sinh(x) + ' , num2str(A7(1))) ;
    elseif RMS_min == RMS(8)    
        output = strcat(num2str(A8(2)) , '*cosh(x) + ' , num2str(A8(1))) ;
    elseif RMS_min == RMS(9)    
        output = strcat(num2str(A9(2)) , '*sin(x) + ' , num2str(A9(1))) ;
    elseif RMS_min == RMS(10)    
        output = strcat(num2str(A10(2)) , '*tan(x) + ' , num2str(A10(1))) ;
    elseif RMS_min == RMS(11)    
        output = strcat(num2str(A11(2)) , '*cot(x) + ' , num2str(A11(1))) ;
    elseif RMS_min == RMS(12)
        output = strcat(num2str(alpha) , '*exp(' , num2str(A12(2)) , '*x)') ;
    end
    
    output = sym(output) ;
end

