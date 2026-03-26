clc();
// --- Define Original Signal ---
n_orig = -2:1;
x = [1, -2, 3, 6];

// --- Case a: y1(n) = x(-n) ---
n1 = -1:2;
y1 = [x(4), x(3), x(2), x(1)]; // Flipped order

// --- Case b: y2(n) = x(n + 3) ---
n2 = n_orig - 3; // Shift left means subtracting from index
y2 = x;

// --- Case c: y3(n) = 2x(-n - 2) ---
// We flip the original n and then shift it
n3 = 1:4; 
y3 = [x(4), x(3), x(2), x(1)]; // Amplitude scaling
y3 = 2.*y3

// --- Plotting ---
clf();

// Row 1: Case a
subplot(3,2,1); 
plot2d3('gnn', n_orig, x); 
plot(n_orig, x, 'ro');
title("Original x(n)"); 
xlabel("n"); 
ylabel("Amp"); xgrid();

subplot(3,2,2);
plot2d3('gnn', n1, y1); 
plot(n1, y1, 'bo');
title("y1(n) = x(-n)"); 
xlabel("n"); 
ylabel("Amp"); xgrid();

// Row 2: Case b
subplot(3,2,3); 
plot2d3('gnn', n_orig, x);
plot(n_orig, x, 'ro');
title("Original x(n)"); 
xlabel("n"); ylabel("Amp"); 
xgrid();

subplot(3,2,4); 
plot2d3('gnn', n2, y2); 
plot(n2, y2, 'bo');
title("y2(n) = x(n+3)"); 
xlabel("n"); 
ylabel("Amp"); 
xgrid();

// Row 3: Case c
subplot(3,2,5); 
plot2d3('gnn', n_orig, x); 
plot(n_orig, x, 'ro');
title("Original x(n)"); 
xlabel("n"); 
ylabel("Amp"); 
xgrid();

subplot(3,2,6); 
plot2d3('gnn', n3, y3); 
plot(n3, y3, 'bo');
title("y3(n) = 2x(-n-2)"); 
xlabel("n"); 
ylabel("Amp"); 
xgrid();
