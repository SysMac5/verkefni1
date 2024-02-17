n = 1280;
L = 2;
w = 0.3;
d = 0.03;
h = L/n;
x = h:h:L;
I = w*d^3/12;
E = 1.3e10;
g = 9.81;
f = -480 * w * d * g * ones(n, 1);

for i = round(1.8/h):n
    f(i) = -g * (70 / 0.2);
end

b = h^4 / (E * I) * f;
A = A_func(n);
y = A\b;

figure;
plot(x, y);
xlabel('x');
ylabel('y(x)');

disp('Displacement on free end:')
disp(y(n))
