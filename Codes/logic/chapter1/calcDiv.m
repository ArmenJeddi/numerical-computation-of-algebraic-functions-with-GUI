function [fRelError, fAbsError, fAns] = calcDev(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2)
syms a b c d e f
syms e(a) e(b) e(c) e(d) e(e) e(f)
fRelError = subs(RelError2+RelError1);
fAns = subs(Val1/Val2);
fAbsError = subs(abs(fRelError*fAns));
end
