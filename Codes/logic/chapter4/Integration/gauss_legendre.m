function [steps, res] = gauss_legendre(F_str, intvl, n, FPD)
%GAUSS_LEGANDRE Summary of this function goes here
%   Detailed explanation goes here

digits(FPD);
syms x;
m = n+1;
steps = cell(m, 1);

P_prev = 1;
P = x;

for i=2:m
    P_next = subs((1/i)*((2*i-1)*x*P-(i-1)*P_prev));
end

pts = vpa(solve(P_next));
P_prime = diff(P_next);
w = zeros(m, 1);

for i=1:m
    w(i) = vpa(2/((1-(pts(i))^2)*(eval(subs(P_prime, pts(i))))^2));
end

a = vpa(intvl(1));
b = vpa(intvl(2));

F = subs((b-a)/2 * subs(F_str, ((b-a)*x+b+a)/2));

res = 0;
for i=1:m
    res = vpa(res + w(i)*eval(subs(F, pts(i))));
end

end

