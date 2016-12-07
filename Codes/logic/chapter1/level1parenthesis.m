function [startIndex,endIndex] = level1parenthesis(f)
tester = 0;
counter = 0;
for i = 1:size(f, 2)
    if(f(i)=='(')
        tester = tester+1;
        if(tester == 1)
            counter=counter+1;
        end
    end
    if(f(i)==')')
        tester = tester-1;
    end
end

startIndex = zeros(counter, 1);
endIndex = zeros(counter, 1);
index1 = 1;
index2 = 1;
for i = 1:size(f, 2)
    if(f(i)=='(')
        tester = tester+1;
        if(tester == 1)
            startIndex(index1)=i;
            index1 = index1+1;
        end
    end
    if(f(i)==')')
        tester = tester-1;
        if(tester==0)
            endIndex(index2)=i;
            index2=index2+1;
        end
    end
end

end