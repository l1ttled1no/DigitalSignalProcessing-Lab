// Folding and Shifting Method
clc;
clear;
close;
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);
y = zeros(1, N);
for n = 0:N-1
sum_val = 0;
for k = 0:N-1
index = modulo(n - k + N, N);
sum_val = sum_val + h(k+1) * x(index + 1);
end
y(n+1) = sum_val;
end
disp("Folding and Shifting Result:");
disp(y);
// Matrix Method
X = zeros(N, N);
for n = 0:N-1
for k = 0:N-1
index = modulo(n - k + N, N);
X(n+1, k+1) = x(index + 1);
end
end
y_matrix = X * h';
disp("Matrix Method Result:");
disp(y_matrix ');
// Plotting
n = 0:N-1;
energy_x = x.^2;
energy_y = y.^2;
max_e = max([energy_x , energy_y]);
// ẽV
clf();
subplot(4,1,1);
plot2d3(n, x, 5);
xtitle("x(n)");
set(gca(), "data_bounds", [min(n), min(x); max(n), max(x)+1]);
subplot(4,1,2);
plot2d3(n, y, 5);
xtitle("y(n)");
set(gca(), "data_bounds", [min(n), min(y); max(n), max(y)+1]);
subplot(4,1,3);
plot2d3(n, energy_x , 5);
xtitle("Energy of x(n)");
set(gca(), "data_bounds", [min(n), 0; max(n), max_e+1]);
subplot(4,1,4);
plot2d3(n, energy_y , 5);
xtitle("Energy of y(n)");
set(gca(), "data_bounds", [min(n), 0; max(n), max_e+1]);
