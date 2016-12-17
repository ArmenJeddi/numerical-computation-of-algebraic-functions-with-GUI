function [fRelError, fAbsError, fAns] = calcSum(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2, parametricVars)
% TODO
syms a b c d e f
syms e(a) e(b) e(c) e(d) e(e) e(f)
fAbsError = subs(AbsError1 + AbsError2);
fAns = subs(Val1+Val2);
fRelError = subs(fAbsError/fAns);
end