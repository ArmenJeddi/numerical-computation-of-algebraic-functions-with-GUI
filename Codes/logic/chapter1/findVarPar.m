function [val, relError, AbsError ] = findVarPar(name, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn)
AbsError = -1;
% name
% varsValues
% vars
for i = 1:size(varsValues, 1)
    if(name==vars(i))
%         name
        val=varsValues(i);
        AbsError = absuluteIn(i);
        relError = AbsError/val;
    end
end
if(size(regexp(name,'a\d+a', 'tokens'))~= 0)
    index = str2double(name(2:size(name, 2)-1));
%     name
    val = myVarsArrPars(index, 5);
    relError = myVarsArrPars(index, 3);
    AbsError = myVarsArrPars(index, 4);
end

if(AbsError == -1)
    val=sym(name);
    AbsError = sym(['e(',name,')']);
    relError = sym(['e(',name,')/',name]);
end
end