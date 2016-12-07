function [steps, relError, AbsError, val] = calcErrorsInStep(f, vars, varsValues,absuluteIn)
myVarsSymbol = @(i) ['a',num2str(i),'a'];
myVarsCounter=1;
stepCounter = 1;
steps = cell(0,1);
relError = cell(0, 1);
AbsError = cell(0, 1);
val = cell(0, 1);
myVarsArrPars = zeros(100, 5);
[startIndex,endIndex] = level1parenthesis(f);
innerStepsCount = startIndex;
innerSteps = cell(0, 1);
inneRrelErrors = cell(0, 1);
inneAbsErrors = cell(0, 1);
innerVals = cell(0, 1);
tempf = f;
if(size(startIndex, 1)>0)
for i = size(startIndex, 1):-1:1
    newf = tempf(startIndex(i): endIndex(i));
    tempf=[tempf(1:startIndex(i) - 1), myVarsSymbol(myVarsCounter), tempf(endIndex(i)+1:size(tempf, 2))];
    newf = newf(2:size(newf, 2)-1);
%     TODO update var list
    [tmpinnerSteps, tmpinneRrelErrors, tmpinneAbsErrors, tmpinnerVals] = calcErrorsInStep(newf, vars, varsValues,absuluteIn);
    innerSteps = [tmpinnerSteps;innerSteps];
    inneRrelErrors = [tmpinneRrelErrors;inneRrelErrors];
    inneAbsErrors =[tmpinneAbsErrors;inneAbsErrors];
    innerVals =[tmpinnerVals;innerVals];
    myVarsArrPars(myVarsCounter, 1) = startIndex(i);
    myVarsArrPars(myVarsCounter, 2) = endIndex(i);
    myVarsArrPars(myVarsCounter, 3) = tmpinneRrelErrors{ size(tmpinneRrelErrors, 1),1};
    myVarsArrPars(myVarsCounter, 4) = tmpinneAbsErrors{ size(tmpinneAbsErrors, 1),1};
    myVarsArrPars(myVarsCounter, 5) = tmpinnerVals{ size(tmpinnerVals, 1),1};
    myVarsCounter = myVarsCounter+1;

end
end
% TODO nasted power and only number and not parameter
mySteps = cell(0, 1);
myrelError = cell(0, 1);
myAbsError = cell(0, 1);
myval = cell(0, 1);

% poer
while(size(regexp(tempf,'(\w+)(\^)(\w+)', 'tokens'))~= 0)
    tmp = regexp(tempf,'(\w+)(\^)(\w+)', 'tokens');
    [start, endd] = regexp(tempf,'(\w+)(\^)(\w+)');
    tmp=tmp{1};
    tmpfirst = tmp{1};
    op = tmp{2};
    tmpsec = tmp{3};
    
    if(size(str2num(tmpfirst))== 0)
        [tmpval1, tmpRelError1, tmpAbsError1] = findVarPar(tmpfirst, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn);
    else
        tmpval1 = str2num(tmpfirst);
        tmpRelError1 = 0;
        tmpAbsError1 = 0;
    end
    
    if(size(str2num(tmpsec))== 0)
        [tmpval2, tmpRelError2, tmpAbsError2] = findVarPar(tmpsec, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn);
    else
        tmpval2 = str2num(tmpsec);
        tmpRelError2 = 0;
        tmpAbsError2 = 0;
    end
   
    [tempRelError, tempAbsError, tempAns] = calcExp(tmpRelError1, tmpAbsError1, tmpval1, tmpRelError2, tmpAbsError2, tmpval2);
    tempf = [tempf(1:start(1)-1), myVarsSymbol(myVarsCounter), tempf(endd(1)+1:size(tempf, 2))];
    myVarsArrPars(myVarsCounter, 1) = start(1);
    myVarsArrPars(myVarsCounter, 2) = endd(1);
    myVarsArrPars(myVarsCounter, 3) = tempRelError;
    myVarsArrPars(myVarsCounter, 4) = tempAbsError;
    myVarsArrPars(myVarsCounter, 5) = tempAns;
    myVarsCounter = myVarsCounter+1;
    
    tmp = [num2str(tmpval1), '^', num2str(tmpval2)];
    
    mySteps = [mySteps; tmp]; 
	myrelError = [myrelError;tempRelError];
    myAbsError = [myAbsError;tempAbsError];
    myval = [myval;tempAns];
end


% * \
while(size(regexp(tempf,'(\w+)(\*|/)(\w+)', 'tokens'))~= 0)
    tmp = regexp(tempf,'(\w+)(\*|/)(\w+)', 'tokens');
    [start, endd] = regexp(tempf,'(\w+)(\*|/)(\w+)');
    tmp=tmp{1};
    tmpfirst = tmp{1};
    op = tmp{2};
    tmpsec = tmp{3};
    
    if(size(str2num(tmpfirst))== 0)
        [tmpval1, tmpRelError1, tmpAbsError1] = findVarPar(tmpfirst, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn);
    else
        tmpval1 = str2num(tmpfirst);
        tmpRelError1 = 0;
        tmpAbsError1 = 0;
    end
    
    if(size(str2num(tmpsec))== 0)
        [tmpval2, tmpRelError2, tmpAbsError2] = findVarPar(tmpsec, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn);
    else
        tmpval2 = str2num(tmpsec);
        tmpRelError2 = 0;
        tmpAbsError2 = 0;
    end
    if(op == '*')
        [tempRelError, tempAbsError, tempAns] = calcMul(tmpRelError1, tmpAbsError1, tmpval1, tmpRelError2, tmpAbsError2, tmpval2);
    else
        [tempRelError, tempAbsError, tempAns] = calcDiv(tmpRelError1, tmpAbsError1, tmpval1, tmpRelError2, tmpAbsError2, tmpval2);
    end
    tempf = [tempf(1:start(1)-1), myVarsSymbol(myVarsCounter), tempf(endd(1)+1:size(tempf, 2))];
    myVarsArrPars(myVarsCounter, 1) = start(1);
    myVarsArrPars(myVarsCounter, 2) = endd(1);
    myVarsArrPars(myVarsCounter, 3) = tempRelError;
    myVarsArrPars(myVarsCounter, 4) = tempAbsError;
    myVarsArrPars(myVarsCounter, 5) = tempAns;
    myVarsCounter = myVarsCounter+1;
    if(op == '*')
        tmp = [num2str(tmpval1), '*', num2str(tmpval2)];
    else
        tmp = [num2str(tmpval1), '/', num2str(tmpval2)];
    end
    mySteps = [mySteps; tmp]; 
	myrelError = [myrelError;tempRelError];
    myAbsError = [myAbsError;tempAbsError];
    myval = [myval;tempAns];
end

% + -

while(size(regexp(tempf,'(\w+)(\+|-)(\w+)', 'tokens'))~= 0)
    tmp = regexp(tempf,'(\w+)(\+|-)(\w+)', 'tokens');
    [start, endd] = regexp(tempf,'(\w+)(\+|-)(\w+)');
    tmp=tmp{1};
    tmpfirst = tmp{1};
    op = tmp{2};
    tmpsec = tmp{3};
    if(size(str2num(tmpfirst))== 0)
        [tmpval1, tmpRelError1, tmpAbsError1] = findVarPar(tmpfirst, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn);
    else
        tmpval1 = str2num(tmpfirst);
        tmpRelError1 = 0;
        tmpAbsError1 = 0;
    end
    
    if(size(str2num(tmpsec))== 0)
        [tmpval2, tmpRelError2, tmpAbsError2] = findVarPar(tmpsec, myVarsCounter, myVarsArrPars, vars, varsValues, absuluteIn);
    else
        tmpval2 = str2num(tmpsec);
        tmpRelError2 = 0;
        tmpAbsError2 = 0;
    end
    if(op == '+')
        [tempRelError, tempAbsError, tempAns] = calcSum(tmpRelError1, tmpAbsError1, tmpval1, tmpRelError2, tmpAbsError2, tmpval2);
    else
        [tempRelError, tempAbsError, tempAns] = calcSub(tmpRelError1, tmpAbsError1, tmpval1, tmpRelError2, tmpAbsError2, tmpval2);
    end
    tempf = [tempf(1:start(1)-1), myVarsSymbol(myVarsCounter), tempf(endd(1)+1:size(tempf, 2))];
    myVarsArrPars(myVarsCounter, 1) = start(1);
    myVarsArrPars(myVarsCounter, 2) = endd(1);
    myVarsArrPars(myVarsCounter, 3) = tempRelError;
    myVarsArrPars(myVarsCounter, 4) = tempAbsError;
    myVarsArrPars(myVarsCounter, 5) = tempAns;
    myVarsCounter = myVarsCounter+1;
    if(op == '+')
        tmp = [num2str(tmpval1), '+', num2str(tmpval2)];
    else
        tmp = [num2str(tmpval1), '-', num2str(tmpval2)];
    end
    mySteps = [mySteps; tmp]; 
	myrelError = [myrelError;tempRelError];
    myAbsError = [myAbsError;tempAbsError];
    myval = [myval;tempAns];
end


steps = [steps;innerSteps];
relError = [relError;inneRrelErrors];
AbsError = [AbsError;inneAbsErrors];
val = [val;innerVals];
steps = [steps;mySteps];
relError = [relError;myrelError];
AbsError = [AbsError;myAbsError];
val = [val;myval];
end

