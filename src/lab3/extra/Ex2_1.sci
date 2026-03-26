// --- Problem 2.1 ---
scf(1); // Open a second window so they don't overlap
n = -5:5; // Use a wide range to see the "elsewhere" zeros

// Define original x(n) using logical segments
part1 = (1 + n/3) .* bool2s(n >= -3 & n <= -1);
part2 = (1) .* bool2s(n >= 0 & n <= 3);
x_p = part1 + part2;

// (b) 1. Fold then delay 4: x(-n) then x(-(n-4)) = x(-n+4)
n_fold_delay = -(n - 4); 
y_b1 = x_p;

// (b) 2. Delay 4 then fold: x(n-4) then x(-n-4)
n_delay_fold = (-n) - 4;
y_b2 = x_p;

// (c) y = x(-n + 4) -> This is actually the same as (b1)
n_c = -n + 4;
y_c = x_p;

// Plotting Problem 2.1
subplot(2,2,1); plot2d3('gnn', n, x_p); plot(n, x_p, 'ro');
title("Original x(n)"); xlabel("n"); ylabel("x(n)"); xgrid();

subplot(2,2,2); plot2d3('gnn', n_fold_delay, y_b1); plot(n_fold_delay, y_b1, 'bo');
title("b1: Fold then Delay 4"); xlabel("n"); ylabel("Amp"); xgrid();

subplot(2,2,3); plot2d3('gnn', n_delay_fold, y_b2); plot(n_delay_fold, y_b2, 'go');
title("b2: Delay 4 then Fold"); xlabel("n"); ylabel("Amp"); xgrid();

subplot(2,2,4); plot2d3('gnn', n_c, y_c); plot(n_c, y_c, 'mo');
title("c: x(-n+4)"); xlabel("n"); ylabel("Amp"); xgrid();
