// 1. Define example parameters (you can change these!)
r = 0.8;          // Radius constraint: 0 < r < 1
w0 = %pi / 4;     // Frequency (e.g., pi/4)

// 2. Define the polynomial variable 'z'
z = poly(0, 'z');

// 3. Define the Numerator and Denominator polynomials
num = r * sin(w0) * z;
den = z^2 - 2 * r * cos(w0) * z + r^2;

// 4. Create the discrete-time linear transfer function
// 'd' stands for discrete time
H = syslin('d', num, den);

// 5. Plot the pole-zero map
clf();            // Clear the current figure window
plzr(H);          // The standard Scilab function for Pole-Zero plots

// 6. Formatting the plot
title("Pole-Zero Pattern for X_1(z)");
