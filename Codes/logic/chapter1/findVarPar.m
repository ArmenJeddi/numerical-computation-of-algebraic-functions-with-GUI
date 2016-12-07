function [val, relError, AbsError ] = findVarPar(name, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn)
% myVarsArrPars
% name
% vars
% varsValues
% size(myVarsCounter, 2)
for i = 1:size(varsValues, 1)
    if(name==vars(i))
        val=varsValues(i);
        AbsError = absuluteIn(i);
        relError = AbsError/val;
    end
end
if(size(regexp(name,'a\d+a', 'tokens'))~= 0)
%     name
%     size(name, 2)
%     name(2:size(name, 2)-1)
    index = str2num(name(2:size(name, 2)-1));
%     disp('here');
%     myVarsArrPars(index, 5)
    val = myVarsArrPars(index, 5);
    relError = myVarsArrPars(index, 3);
    AbsError = myVarsArrPars(index, 4);
end
end