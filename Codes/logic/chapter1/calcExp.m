function [fRelError, fAbsError, fAns] = calcExp(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2)
syms a b c d e f
syms e(a) e(b) e(c) e(d) e(e) e(f)
fRelError = 0;
for i = 1:Val2
    fRelError = subs(fRelError+RelError1);
end
fAns = Val1^Val2;
fAbsError = subs(abs(fRelError*fAns));
end