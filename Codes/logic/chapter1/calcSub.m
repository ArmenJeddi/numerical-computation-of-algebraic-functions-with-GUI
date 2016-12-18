function [fRelError, fAbsError, fAns] = calcSub(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2, ischop, FPD)
syms a b c d e f
syms e(a) e(b) e(c) e(d) e(e) e(f)
digits(FPD);
fAbsError = subs(AbsError1 + AbsError2);
fAns = subs(Val1-Val2);
fRelError = subs(abs(fAbsError/fAns));
vpa(fAbsError);
vpa(fAns);
vpa(fRelError);
end