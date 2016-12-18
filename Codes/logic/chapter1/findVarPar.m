function [val, relError, AbsError ] = findVarPar(name, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn, ischop, FPD)
AbsError = -1;
digits(FPD);
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
    index = (name(2:size(name, 2)-1));
%     name
% myVarsArrPars
% class(index)
index = str2num(index);
% myVarsArrPars(index, 5)
    val = myVarsArrPars(index, 5);
    relError = myVarsArrPars(index, 3);
    AbsError = myVarsArrPars(index, 4);
end

if(AbsError == -1)
    val=sym(name);
    AbsError = sym(['e(',name,')']);
    relError = sym(['e(',name,')/',name]);
%     name
end

% if(ischop==1)
%     val = subs(floor(subs(val*10))/10)
%     relError = subs(floor(subs(relError*10))/10)
%     AbsError = subs(floor(subs(AbsError*10))/10)
%     
% end
vpa(val);
vpa(relError);
vpa(AbsError);
end