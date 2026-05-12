// --- Solution for Problem 4.11 ---

// 1. Define the time axis and the original signal x(n)
n = -6:4; 
// Pad x(n) with zeros to match the full n vector (-6 to 4)
x = [0, 0, 1, 0, -1, 2, 3, 0, 0, 0, 0]; 
// Create x(-n) by reversing the array
x_rev = x($:-1:1); 

// 2. Compute Even and Odd parts
x_e = 0.5 * (x + x_rev);
x_o = 0.5 * (x - x_rev);

// 3. Compute y(n) components
// Term 1: x_e(n+2) (Shift left by 2 samples)
// We achieve this by dropping the first 2 elements and padding 2 zeros at the end
xe_shifted = [x_e(3:$), 0, 0]; 

// Term 2: -j * x_o(n)
// Combine to get y(n)
y = xe_shifted - %i * x_o;

// 4. Sketch the Complex Signal
scf(0); clf();
f = gcf(); f.figure_name = "Problem 4.11: Complex Sequence y(n)";

// Plot Real Part
subplot(2,1,1);
plot2d3('gnn', n, real(y)); plot(n, real(y), 'ro', 'MarkerFaceColor', 'r');
title('Real Part of y(n) = x_e(n+2)'); 
xlabel('n'); ylabel('Amplitude');
xgrid();

// Plot Imaginary Part
subplot(2,1,2);
plot2d3('gnn', n, imag(y)); plot(n, imag(y), 'bo', 'MarkerFaceColor', 'b');
title('Imaginary Part of y(n) = -x_o(n)'); 
xlabel('n'); ylabel('Amplitude');
xgrid();
