function [steps, res] = romberg(F_str, intvl, FPD)
%ROMBERG Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);

TDfltDim = 10; % Ten rows and columns for the table at frist to increase
               % performance, additional rows will be added if needed.
dataTable = cell(TDfltDim, TDfltDim);

% initial h is equal to the length of the interval
dataTable{1, 1} = vpa(intvl(2)-intvl(1));

[~, dataTable{1, 2}] = trapezoidal(F_str, intvl, dataTable{1, 1}, FPD);

thresh = 10; % A relatively big number at first
i = 2;
j = 2;

while true
    dataTable{i, 1} = vpa(dataTable{i-1, 1}/2);
    [~, dataTable{i, 2}] = trapezoidal(F_str, intvl, dataTable{i, 1}, FPD);
    
    for j = 3:i+1
        dataTable{i, j} = vpa(((4^(j-2))*dataTable{i, j-1} - ...
            dataTable{i-1, j-1})/(4^(j-2)-1));
    end
    
    diff = dataTable{i-1, j-1}-dataTable{i, j};
    % divergence check
    if abs(diff) > thresh || abs(diff) < 10^(-FPD)
        break
    end
    
    thresh = abs(diff);
    i = i+1;
end

steps = cell(i-1, j-1);
for k=1:i-1
    for u=1:j-1
        steps{k, u} = char(dataTable{k, u});
    end
end
res = vpa(dataTable{i-1, j-1});

end