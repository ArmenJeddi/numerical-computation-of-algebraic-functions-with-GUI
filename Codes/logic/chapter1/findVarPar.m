function [val, relError, AbsError ] = findVarPar(name, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn)
for i = 1:size(varsValues, 1)
    if(name==vars(i))
        val=varsValues(i);
        AbsError = absuluteIn(i);
        relError = AbsError/val;
    end
end
if(size(regexp(name,'a\d+a', 'tokens'))~= 0)
    index = str2num(name(2:size(name, 2)-1));
    val = myVarsArrPars(index, 5);
    relError = myVarsArrPars(index, 3);
    AbsError = myVarsArrPars(index, 4);
end
end