// ==========================================
// PROBLEM 2.6: Time Invariance Tests
// ==========================================

// Define the piecewise input signal x(n) as a function
function val = x_in(idx)
    val = zeros(idx); // Default to 0
    val(idx >= 0 & idx <= 3) = 1; // Set to 1 in the range [0, 3]
endfunction

// Define a wide time axis for our sketches
n = -2:6; 

// ------------------------------------------
// Part (b): y(n) = x(n^2)  [Time Variant]
// ------------------------------------------
scf(1); clf();
f = gcf(); f.figure_name = "Problem 2.6 (b): y(n) = x(n^2)";
subplot(3,2,1); plot2d3('gnn', n, x_in(n)); plot(n, x_in(n), 'ro'); title("1. Input x(n)"); xgrid();
subplot(3,2,2); plot2d3('gnn', n, x_in(n.^2)); plot(n, x_in(n.^2), 'bo'); title("2. Output y(n) = x(n^2)"); xgrid();
subplot(3,2,3); plot2d3('gnn', n, x_in((n-2).^2)); plot(n, x_in((n-2).^2), 'mo'); title("3. Delayed Output y(n-2)"); xgrid();
subplot(3,2,4); plot2d3('gnn', n, x_in(n-2)); plot(n, x_in(n-2), 'go'); title("4. Delayed Input x2(n) = x(n-2)"); xgrid();
subplot(3,2,5); plot2d3('gnn', n, x_in(n.^2 - 2)); plot(n, x_in(n.^2 - 2), 'co'); title("5. Output of Delayed Input T[x2(n)]"); xgrid();
// Compare Plot 3 and Plot 5: They are different -> Time Variant

// ------------------------------------------
// Part (c): y(n) = x(n) - x(n-1)  [Time Invariant]
// ------------------------------------------
scf(2); clf();
f = gcf(); f.figure_name = "Problem 2.6 (c): y(n) = x(n) - x(n-1)";
y_c      = x_in(n) - x_in(n-1);
yd_c     = x_in(n-2) - x_in(n-3); // y(n-2)
y2_c     = x_in(n-2) - x_in(n-3); // T[x(n-2)]

subplot(3,2,1); plot2d3('gnn', n, x_in(n)); plot(n, x_in(n), 'ro'); title("1. Input x(n)"); xgrid();
subplot(3,2,2); plot2d3('gnn', n, y_c); plot(n, y_c, 'bo'); title("2. Output y(n)"); xgrid();
subplot(3,2,3); plot2d3('gnn', n, yd_c); plot(n, yd_c, 'mo'); title("3. Delayed Output y(n-2)"); xgrid();
subplot(3,2,4); plot2d3('gnn', n, x_in(n-2)); plot(n, x_in(n-2), 'go'); title("4. Delayed Input x2(n) = x(n-2)"); xgrid();
subplot(3,2,5); plot2d3('gnn', n, y2_c); plot(n, y2_c, 'co'); title("5. Output of Delayed Input T[x2(n)]"); xgrid();
// Compare Plot 3 and Plot 5: They are exactly the same -> Time Invariant

// ------------------------------------------
// Part (d): y(n) = n*x(n)  [Time Variant]
// ------------------------------------------
scf(3); clf();
f = gcf(); f.figure_name = "Problem 2.6 (d): y(n) = n*x(n)";
y_d      = n .* x_in(n);
yd_d     = (n-2) .* x_in(n-2); // y(n-2) replaces all 'n' with 'n-2'
y2_d     = n .* x_in(n-2);     // T[x(n-2)] only delays the signal, not the scaling factor 'n'

subplot(3,2,1); plot2d3('gnn', n, x_in(n)); plot(n, x_in(n), 'ro'); title("1. Input x(n)"); xgrid();
subplot(3,2,2); plot2d3('gnn', n, y_d); plot(n, y_d, 'bo'); title("2. Output y(n)"); xgrid();
subplot(3,2,3); plot2d3('gnn', n, yd_d); plot(n, yd_d, 'mo'); title("3. Delayed Output y(n-2)"); xgrid();
subplot(3,2,4); plot2d3('gnn', n, x_in(n-2)); plot(n, x_in(n-2), 'go'); title("4. Delayed Input x2(n) = x(n-2)"); xgrid();
subplot(3,2,5); plot2d3('gnn', n, y2_d); plot(n, y2_d, 'co'); title("5. Output of Delayed Input T[x2(n)]"); xgrid();
// Compare Plot 3 and Plot 5: They are different -> Time Variant
