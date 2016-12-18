function out = rounder(val, ischop , digitsCount)
digits(FPD);
 if(ischop==1)
    val = subs(floor(subs(val*10^digitsCount))/10^digitsCount);
end
out = vpa(val, digitsCount);
end

