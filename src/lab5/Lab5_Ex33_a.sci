// Scilab script to sketch the ROC: 1/3 < |z| < 2

clf(); // Clear current figure window

// 1. Setup the plot geometry
ax = gca();
ax.isoview = "on"; // Crucial: Keeps circles perfectly round, not oval
ax.data_bounds = [-4, -4; 4, 4]; // Set the viewing frame

// 2. Define angles for drawing circles
theta = linspace(0, 2*%pi, 200);

// Define radii
r_in = 1/2;
r_out = 3;

// --- 3. Draw the Shaded Region (The ROC) ---
// Draw the outer boundary filled with light gray
xfpoly(r_out * cos(theta), r_out * sin(theta), color('gray85')); 
// Draw the inner hole filled with white to 'cut out' the center
xfpoly(r_in * cos(theta), r_in * sin(theta), color('white'));    

// --- 4. Draw Outlines and Reference Lines ---
// Outer boundary line (|z| = 2)
plot2d(r_out * cos(theta), r_out * sin(theta), style=color('blue'));

// Inner boundary line (|z| = 1/3)
plot2d(r_in * cos(theta), r_in * sin(theta), style=color('blue'));

// Draw the Unit Circle (|z| = 1) in green for stability reference
plot2d(cos(theta), sin(theta), style=color('green')); 

// Draw Real and Imaginary axes
plot2d([-4, 4], [0, 0], style=color('black')); // X-axis (Real)
plot2d([0, 0], [-4, 4], style=color('black')); // Y-axis (Imaginary)

// --- 5. Labels and Titles ---
title("Region of Convergence: 1/2 < |z| < 3");
xlabel("Real Axis");
ylabel("Imaginary Axis");

// Add small text labels next to the boundaries
xstring(r_in + 0.05, 0.1, "|z|=1/2");
xstring(1.05, 0.1, "|z|=1");
xstring(r_out + 0.05, 0.1, "|z|=3");
