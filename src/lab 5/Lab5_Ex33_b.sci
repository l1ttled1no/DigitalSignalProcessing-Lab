// Scilab script to sketch the ROC: |z| > 2

clf(); // Clear current figure window

// 1. Setup the plot geometry
ax = gca();
ax.isoview = "on"; // Keeps the circles perfectly round
ax.data_bounds = [-5, -5; 5, 5]; // View window from -5 to +5

// 2. Define angles for drawing circles
theta = linspace(0, 2*%pi, 200);
r_pole = 2; // The boundary of the ROC

// --- 3. Draw the Shaded Region (The ROC) ---
// Create a giant box that covers the entire viewable axes
x_box = [-5, 5, 5, -5];
y_box = [5, 5, -5, -5];
// Fill the giant box with gray (represents extending to infinity)
xfpoly(x_box, y_box, color('gray85')); 

// Draw a white circle in the middle to 'cut out' the |z| < 2 region
xfpoly(r_pole * cos(theta), r_pole * sin(theta), color('white'));    

// --- 4. Draw Outlines and Reference Lines ---
// Draw the boundary line of the pole (|z| = 2) in blue
plot2d(r_pole * cos(theta), r_pole * sin(theta), style=color('blue'));

// Draw the Unit Circle (|z| = 1) in green for stability reference
plot2d(cos(theta), sin(theta), style=color('green')); 

// Draw Real and Imaginary axes
plot2d([-5, 5], [0, 0], style=color('black')); // X-axis (Real)
plot2d([0, 0], [-5, 5], style=color('black')); // Y-axis (Imaginary)

// --- 5. Labels and Titles ---
title("Region of Convergence: |z| > 2 (Unstable, Causal)");
xlabel("Real Axis");
ylabel("Imaginary Axis");

// Add text labels next to the boundaries
xstring(2.1, 0.2, "|z|=2 (Pole Boundary)");
xstring(1.1, 0.2, "|z|=1 (Unit Circle)");
