function [fRelError, fAbsError, fAns] = calcSum(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2, ischop, FPD)
% TODO
digits(FPD);
syms a b c d e f
syms e(a) e(b) e(c) e(d) e(e) e(f)
fAbsError = subs(AbsError1 + AbsError2);
fAns = subs(Val1+Val2);
fRelError = subs(fAbsError/fAns);
% TODO
% if(ischop==1)
%     fAbsError = subs(floor(subs(fAbsError*10))/10)
%     fAns = subs(floor(subs(fAns*10))/10)
%     fRelError = subs(floor(subs(fRelError*10))/10)
%     
% end
vpa(fAbsError);
vpa(fAns);
vpa(fRelError);
end