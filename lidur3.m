n_base = 10;
L = 2;
w = 0.3;
d = 0.03;
I = w*d^3/12;
E = 1.3e10;
g = 9.81;

f = -480 * w * d * g; % krafturinn

error = zeros(11,1);
condition = zeros(11,1);

for k = 1:11

    n = n_base * 2^k;
    h = L/n;
    x = h:h:L;
    y_correct = (f / (24 * E * I)) .* x.^2 .* (x.^2 - 4*L.*x + 6*L^2);

    % Skilgreina b
    b = h^4 / (E * I) * f * ones(n, 1);
    
    % Skilgreina A
    A = sparse(n,n);
    for i = 1:n
        for j = 1:n
            if A_func(i, j, n) ~= 0
                A(i, j) = A_func(i, j, n);
            end
        end
    end
    
    y = A\b;
    
    error(k) = abs(y(n) - y_correct(n));
    condition(k) = condest(A);

end

table(zeros(11,1),error)
table(zeros(11,1),condition)
