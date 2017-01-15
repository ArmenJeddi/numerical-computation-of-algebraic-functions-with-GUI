function [steps, res] = gauss_legendre(F_str, intvl, n, FPD)
%GAUSS_LEGANDRE Summary of this function goes here
%   Detailed explanation goes here

% TODO steps should be added.

digits(FPD);
syms x;
m = n+1;
a = vpa(intvl(1));
b = vpa(intvl(2));
res = 0;
steps = cell(m+10, 1);

P_prev = 1;
P = x;

steps{1} = ['m = ', num2str(m)];
steps{2} = '';
steps{3} = 'P_0(x) = 1';
steps{4} = 'P_1(x) = x';
steps{5} = '';

if m == 1
    x_0 = 1;
    w_0 = 2;
    F = subs((b-a)/2 * subs(F_str, ((b-a)*x+b+a)/2));
    f0 = vpa(eval(subs(F, x_0)));
    res = vpa(w_0*f0);
    
    steps{6} = 'x_0 = 0 ,  w_0 = 2';
    steps{7} = '';
    steps{8} = ['f(x) = ', char(F)];
    steps{9} = '';
    steps{10} = ['Answer = w_0*f(x_0) = 2*', char(f0)]; 
    steps{11} = ['       = ', char(res)];
    return
end

steps{6} = 'Calculating next P_i(x)s ... ';

for i=2:m
    P_next = subs((1/i)*((2*i-1)*x*P-(i-1)*P_prev));
    steps{i+6} = ['P_', num2str(i), '(x) = ', char(P_next)];
    P_prev = P;
    P = P_next;
end

pts = vpa(solve(P_next));
P_prime = diff(P_next);
w = zeros(m+3, 1);

steps{m+7} = '';
steps{m+8} = 'Calculating x_is ...';
steps{m+9} = '';
k = m+9;
for i=1:size(pts, 1)
    steps{k+i} = ['x_', num2str(i-1), ' = ', char(vpa(pts(i)))];
end

k = k + size(pts, 1)+1;
steps{k} = '';
steps{k+1} = 'Calculating w_is ...';
steps{k+2} = '';
steps{k+3} = 'w_i = 2 / (1-x_i^2)(P''_m(x_i))^2';
steps{k+4} = ['P''_m(x) = ', char(P_prime)];
steps{k+5} = '';
k = k+5;

for i=1:m
    w(i) = vpa(2/((1-(pts(i))^2)*(eval(subs(P_prime, pts(i))))^2));
    steps{k+i} = ['w_', num2str(i-1), ' = ', char(vpa(w(i)))];
end

k = k+m+2;
steps{k-1} = '';
steps{k} = ['a = ', char(a), ' ,  b = ', char(b)];
steps{k+1} = 'Substituting x with ((b-a)x + b + a)/2';
steps{k+2} = 'and dx with (1/2)(b-a)dx :';
steps{k+3} = '';

F = subs((b-a)/2 * subs(F_str, ((b-a)*x+b+a)/2));

steps{k+4} = ['updated function: f = ', char(F)];
steps{k+5} = '';
steps{k+6} = ['Answer = w0f0 + ... + w', num2str(n), 'f', ...
    num2str(n)];
k = k+7;

finalstep = '       = ';

for i=1:m
    fi = vpa(eval(subs(F, pts(i))));
    finalstep = [finalstep, char(vpa(w(i))), ' * ', char(fi)];
    if i ~= m
        finalstep = [finalstep, ' + '];
    end
    res = vpa(res + w(i)*fi);
end

steps{k} = finalstep;
steps{k+1} = ['       = ', char(res)];

end

