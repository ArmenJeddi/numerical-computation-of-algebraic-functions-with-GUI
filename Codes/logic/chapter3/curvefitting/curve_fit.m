function [ output] = curve_fit( X , Y , choice )

    n = size(X)  ;
    S_x_1 = sum(X) ;
    S_x_2 = sum(X .^ 2) ;
    S_y = sum(Y) ;
    switch(choice)
        case 0  %the case when function is not specified
            output = curve_not_given(X , Y) ; 
        case 1 % P_3(x)
            S_x_3 = sum(X .^ 3) ;
            S_x_4 = sum(X .^ 4) ;
            S_x_5 = sum(X .^ 5) ;
            S_x_6 = sum(X .^ 6) ;
            S_x_1_y_1 = sum(X .* Y) ;
            S_x_2_y = sum( (X .^2 ) .* Y ) ;
            S_x_3_y = sum( (X .^3 ) .* Y ) ;
            A = linsolve([n(1) , S_x_1 , S_x_2 , S_x_3 ; S_x_1 , S_x_2 , S_x_3 , S_x_4 ; S_x_2 , S_x_3 , S_x_4 , S_x_5 ;S_x_3 , S_x_4 , S_x_5 , S_x_6] , [S_y ; S_x_1_y_1 ; S_x_2_y ; S_x_3_y] );
            output = strcat('(', num2str(A(4)) ,'*x^3) + ' , '(', num2str(A(3)) ,'*x^2) + ' , '(', num2str(A(2)) ,'*x) + ' , '(',num2str(A(1)),')') ;
            
        case 2 % y = 1/(ax+b)
            S_y_1 = sum(1 ./ Y) ;
            S_x_1_y_2 = sum(X .* (1 ./ Y)) ;
            A = linsolve([n(1) , S_x_1 ; S_x_1 , S_x_2 ] , [S_y_1 ; S_x_1_y_2] );
            output = strcat('1/(',num2str(A(2)),'*x+' , num2str(A(1)) , ')' ) ;
            
        case 3 % cos(x)
            X3 = cos(X) ;
            S_X3 = sum(X3) ;
            S_X3_2 = sum(X3 .^ 2) ;
            S_X3Y = sum(X3 .* Y) ;
            A = linsolve([n(1) , S_X3 ; S_X3 , S_X3_2 ] , [ S_y ; S_X3Y ]);
            output = strcat( num2str(A(2)) , '*cos(x) + ' , num2str(A(1)) ) ;
            
        case 4 % tanh
            X4 = tanh(X) ;
            S_X4 = sum(X4) ;
            S_X4_2 = sum(X4 .^ 2) ;
            S_X4Y = sum(X4 .* Y) ;
            A = linsolve([n(1) , S_X4 ; S_X4 , S_X4_2 ] , [ S_y ; S_X4Y ]);
            output = strcat(num2str(A(2)) , '*tanh(x) + ' , num2str(A(1))) ;
            
        case 5 % ln(x) ....  log(x) is in fact ln(x)
            X5 = log(X) ;
            S_X5 = sum(X5) ;
            S_X5_2 = sum(X5 .^ 2) ;
            S_X5Y = sum(X5 .* Y ) ;    
            A = linsolve([n(1) , S_X5 ; S_X5 , S_X5_2 ] , [ S_y ; S_X5Y ]);
            output = strcat(num2str(A(2)) , '*log(x) + ' , num2str(A(1))) ;
            
        case 6  % coth
            X6 = coth(X) ;
            S_X6 = sum(X6) ;
            S_X6_2 = sum(X6 .^ 2) ;
            S_X6Y = sum(X6 .* Y) ;
            A = linsolve([n(1) , S_X6 ; S_X6 , S_X6_2 ] , [ S_y ; S_X6Y ]);
            output = strcat(num2str(A(2)) , '*coth(x) + ' , num2str(A(1))) ;
            
        case 7  % sinh
            X7 = sinh(X) ;
            S_X7 = sum(X7) ;
            S_X7_2 = sum(X7 .^ 2) ;
            S_X7Y = sum(X7 .* Y) ;
            A = linsolve([n(1) , S_X7 ; S_X7 , S_X7_2 ] , [ S_y ; S_X7Y ]);
            output = strcat(num2str(A(2)) , '*sinh(x) + ' , num2str(A(1))) ;
            
        case 8 %    cosh
            X8 = cosh(X) ;
            S_X8 = sum(X8) ;
            S_X8_2 = sum(X8 .^ 2) ;
            S_X8Y = sum(X8 .* Y) ;
            A = linsolve([n(1) , S_X8 ; S_X8 , S_X8_2 ] , [ S_y ; S_X8Y ]);
            output = strcat(num2str(A(2)) , '*cosh(x) + ' , num2str(A(1))) ;
            
        case 9 %    sin
            X9 = sin(X) ;
            S_X9 = sum(X9) ;
            S_X9_2 = sum(X9 .^ 2) ;
            S_X9Y = sum(X9 .* Y) ;
            A = linsolve([n(1) , S_X9 ; S_X9 , S_X9_2 ] , [ S_y ; S_X9Y ]);
            output = strcat(num2str(A(2)) , '*sin(x) + ' , num2str(A(1))) ;
            
        case 10 %   tan
            X10 = tan(X) ;
            S_X10 = sum(X10) ;
            S_X10_2 = sum(X10 .^ 2) ;
            S_X10Y = sum(X10 .* Y) ;
            A = linsolve([n(1) , S_X10 ; S_X10 , S_X10_2 ] , [ S_y ; S_X10Y ]);
            output = strcat(num2str(A(2)) , '*tan(x) + ' , num2str(A(1))) ;
            
        case 11 %   cot
            X11 = cot(X) ;
            S_X11 = sum(X11) ;
            S_X11_2 = sum(X11 .^ 2) ;
            S_X11Y = sum(X11 .* Y) ;
            A = linsolve([n(1) , S_X11 ; S_X11 , S_X11_2 ] , [ S_y ; S_X11Y ]);
            output = strcat(num2str(A(2)) , '*cot(x) + ' , num2str(A(1))) ;
            
        case 12 %   exp
            X12 = X ;
            S_X12 = sum(X12);
            S_X12_2 = sum(X12 .^ 2);
            Y12 = log(Y) ;
            S_Y12 = sum(Y12) ;
            S_X12Y = sum(X12 .* Y12) ;
            A = linsolve([n(1) , S_X12 ; S_X12 , S_X12_2 ] , [ S_Y12 ; S_X12Y ]);
            alpha = exp(A(1)) ;
            output = strcat(num2str(alpha) , '*exp(' , num2str(A(2)) , '*x)') ;
            
    end
    
   output = sym(output) ;
    
end

