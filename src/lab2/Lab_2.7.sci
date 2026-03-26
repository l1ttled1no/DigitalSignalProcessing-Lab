clc();
// 1. Define the common time index
n = -1 : 3;

// 2. Define signals (padded with zeros to match the length of n)
// n:    -1  0  1  2  3
x1 = [ 0, 0, 1, 3, -2 ]; 
x2 = [ 0, 1, 2, 3,  0 ];

// 3. Perform addition
y = x1 .* x2;

// --- Plotting ---
clf();

// Plot x1(n)
subplot(3,1,1);
plot2d3('gnn', n, x1);
plot(n, x1, 'ro');
title("Signal x1(n) = {0, 1, 3, -2}");
xlabel("n");
ylabel("Amplitude");

// Plot x2(n)
subplot(3,1,2);
plot2d3('gnn', n, x2);
plot(n, x2, 'bo');
title("Signal x2(n) = {0, 1, 2, 3}");
xlabel("n");
ylabel("Amplitude");

// Plot y(n)
subplot(3,1,3);
plot2d3('gnn', n, y);
plot(n, y, 'go');
title("Result y(n) = x1(n) * x2(n)");
xlabel("n");
ylabel("Amplitude");

// Add grids for better visibility
for i=1:3; subplot(3,1,i); xgrid(); end
