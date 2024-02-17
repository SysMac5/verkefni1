n_base = 10;
L = 2;
w = 0.3;
d = 0.03;
I = w*d^3/12;
E = 1.3e10;
g = 9.81;
p=100;
f = -480 * w * d * g;

error = zeros(11,1);
condition = zeros(11,1);
nvalue = zeros(11,1);
hvalue = zeros(11,1);

for k = 1:11

    n = n_base * (2^k);
    h = L/n;
    x = h:h:L;
    S=-p*g*sin(pi*x'/L);
    y_correct = (f * x.^2 .* (L - x).^2) / (24 * E * I) ...
        - (p * g * L^2) / (pi^4 * E * I) * (L^2 * sin(pi * x / L) + pi * x .* (x - L));

    b = h^4 / (E * I) * (f * ones(n,1) + S);
    A = A_func_clamped(n);
    y = A\b;
    
    error(k) = abs(y(n) - y_correct(n));
    condition(k) = condest(A);
    nvalue(k) = n;
    hvalue(k) = h;

end

table(nvalue,error)
table(nvalue,condition)

figure;
plot(x, y);
hold on
plot(x,y_correct)
xlabel('x');
ylabel('y(x)');
legend;
title('');


figure;
loglog(hvalue,error,'-o');
xlabel('log(h)');
ylabel('Error');
title('Error vs. h on a log-log graph');
grid on;