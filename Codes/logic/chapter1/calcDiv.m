function [fRelError, fAbsError, fAns] = calcDev(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2)
fRelError = RelError2+RelError1;
fAns = Val1./Val2;
fAbsError = abs(fRelError.*fAns);
end
