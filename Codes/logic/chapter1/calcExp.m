function [fRelError, fAbsError, fAns] = calcExp(RelError1, AbsError1, Val1, RelError2, AbsError2, Val2)
fRelError = 0;
for i = 1:Val2
    fRelError = fRelError+RelError1;
end
fAns = Val1.^Val2;
fAbsError = abs(fRelError*fAns);
end