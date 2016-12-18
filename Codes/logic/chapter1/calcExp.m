function [fRelError, fAbsError, fAns] = calcExp(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2, ischop, FPD)
syms a b c d e f
syms e(a) e(b) e(c) e(d) e(e) e(f)
digits(FPD);
fAns = subs(Val1^Val2);
fRelError = subs(0);
fAbsError = subs(0);
if (AbsError1 == 0)
    if (AbsError1 == 0)
        return;
    end
end

% Val1
% Val2
for i = 1:Val2
    fRelError = subs(fRelError+RelError1);
end
fAbsError = subs(abs(fRelError*fAns));
vpa(fAbsError);
vpa(fAns);
vpa(fRelError);
end