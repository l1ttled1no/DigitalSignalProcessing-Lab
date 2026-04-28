// Scilab script to sketch the pole-zero pattern for (r^n * sin(w0 * n))u(n)

clf(); // Clear the figure

// 1. Define the parameters
r = 0.8;       // Radius (must be 0 < r < 1)
w0 = %pi / 4;  // Angle (45 degrees)

// 2. Define Pole and Zero locations based on derivation
z_zero = 0; // Zero at the origin
p_pole1 = r * exp(%i * w0);  // Pole at +w0
p_pole2 = r * exp(-%i * w0); // Pole at -w0

// 3. Setup the plot geometry
ax = gca();
ax.isoview = "on"; // Keep circles perfectly round
ax.data_bounds = [-1.5, -1.5; 1.5, 1.5]; // Frame limits

// 4. Draw Reference Lines
theta = linspace(0, 2*%pi, 200);

// Draw the Unit Circle (|z| = 1) in green
plot2d(cos(theta), sin(theta), style=color('green')); 

// Draw a dashed gray circle showing the radius 'r'
plot2d(r * cos(theta), r * sin(theta), style=color('gray70')); 

// Draw Real and Imaginary axes
plot2d([-1.5, 1.5], [0, 0], style=color('black')); // X-axis (Real)
plot2d([0, 0], [-1.5, 1.5], style=color('black')); // Y-axis (Imaginary)

// 5. Plot the Poles and Zeros
// Plot Zero as a blue 'o'
plot(real(z_zero), imag(z_zero), 'bo'); 

// Plot Poles as red 'x' marks
plot(real(p_pole1), imag(p_pole1), 'rx');
plot(real(p_pole2), imag(p_pole2), 'rx');

// 6. Labels and formatting
title("Pole-Zero Pattern: x1(n) = (r^n sin(\omega_0 n))u(n)");
xlabel("Real Axis");
ylabel("Imaginary Axis");

// Add text annotations near the markers
xstring(0.05, 0.05, "Zero (z=0)");
xstring(real(p_pole1) + 0.05, imag(p_pole1), "Pole (r e^{j\omega_0})");
xstring(real(p_pole2) + 0.05, imag(p_pole2), "Pole (r e^{-j\omega_0})");
xstring(1.05, 0.1, "Unit Circle (|z|=1)");
