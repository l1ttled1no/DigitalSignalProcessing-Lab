// Folding and Shifting Method
clc;
clear;
close;
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];
M = length(h);
N = length(x);
Ly = N + M - 1;
y = zeros(1, Ly);
for n = 0:Ly-1
sum_val = 0;
for k = 0:M-1
idx = n - k;
if idx >= 0 & idx < N
sum_val = sum_val + h(k+1) * x(idx + 1);
end
end
y(n+1) = sum_val;
end
disp("Folding and Shifting Result:");
disp(y);
// Matrix Method
h_col = h(:);
H = zeros(Ly, N);
for i = 1:N
H(i:i+M-1, i) = h_col;
end
H = H(1:Ly, :); // Trim to Ly rows
y_matrix = H * x';
disp("Matrix Method Result:");
disp(y_matrix);
// Plotting
energy_x = x.^2;
energy_y = y.^2;
max_energy = max([energy_x , energy_y]);
clf();
subplot(4,1,1);
plot2d3(0:N-1, x, style=2);
xtitle("x(n)");
set(gca(), "data_bounds", [0, min(x); N-1, max(x)+1]);
subplot(4,1,2);
plot2d3(0:Ly-1, y, style=5);
xtitle("y(n)");
set(gca(), "data_bounds", [0, min(y); Ly-1, max(y)+1]);
subplot(4,1,3);
plot2d3(0:N-1, energy_x , style=2);
xtitle("Energy of Signals x(n)");
set(gca(), "data_bounds", [0, 0; N-1, max_energy+1]);
subplot(4,1,4);
plot2d3(0:Ly-1, energy_y , style=5);
xtitle("Energy of Signals y(n)");
set(gca(), "data_bounds", [0, 0; Ly-1, max_energy+1]);
