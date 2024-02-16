n = 10;
L = 2;
w = 0.3;
d = 0.03;
h = L/n;
x = h:h:L;
I = (w*d^3)/12;
E = 1.3e10;
g = 9.81;
f = -480 * w * d * g;

b = h^4 / (E * I) * f * ones(n, 1);
A = A_func(n);
y = A\b;

disp('y =')
disp(y)

x = linspace(0, L, n+1);
y_correct = (f / (24 * E * I)) * x.^2 .* (x.^2 - 4*L*x + 6*L^2);

hold on;
plot(x(2:end), y, 'b-o', 'DisplayName', 'Calculated Solution');
plot(x, y_correct, 'r-', 'DisplayName', 'Correct Solution');
hold off;

xlabel('Position along the beam (m)');
ylabel('Displacement (m)');
title('Comparison of Beam Displacement');
legend('Location', 'best');

error = abs(y(end) - y_correct(end));
fprintf('Error at the end of the beam (x = L): %g\n', error);
