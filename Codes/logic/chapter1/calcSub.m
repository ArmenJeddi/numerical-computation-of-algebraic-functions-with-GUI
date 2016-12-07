function [fRelError, fAbsError, fAns] = calcSub(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2)
fAbsError = AbsError1 + AbsError2;
fAns = Val1-Val2;
fRelError = abs(fAbsError/fAns);
end