n_base = 10;
L = 2;
w = 0.3;
d = 0.03;
I = w*d^3/12;
E = 1.3e10;
g = 9.81;
f = -480 * w * d * g;

error = zeros(11,1);
condition = zeros(11,1);
nvalue = zeros(11,1);

for k = 1:11

    n = n_base * (2^k);
    h = L/n;
    x = h:h:L;
    y_correct = (f / (24 * E * I)) * x.^2 .* (x.^2 - 4*L.*x + 6*L^2);

    disp('size(b)')
    size(b)
    b = h^4 / (E * I) * f * ones(n, 1);
    A = A_func(n);
    y = A\b;
    
    error(k) = abs(y(n) - y_correct(n));
    condition(k) = condest(A);
    nvalue(k) = n;

end

table(nvalue,error)
table(nvalue,condition)


