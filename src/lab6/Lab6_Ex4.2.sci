// Scilab Script for Problem 4.2: Spectra Sketches
A = 1; // Arbitrary amplitude
a = 1; // Arbitrary decay constant (a > 0)

// Frequency and Time axes
F = -5:0.01:5; 
t = -3:0.01:3;

// --- Problem 4.2 (a): One-Sided Exponential ---
xa_1 = A * exp(-a * t) .* (t >= 0);
Xa_1_mag = A ./ sqrt(a^2 + (2 * %pi * F).^2);

// CORRECTED LINE: Use single-argument atan with division
Xa_1_phase = -atan((2 * %pi * F) / a);

scf(0); clf();
f = gcf(); f.figure_name = "Problem 4.2(a): One-Sided Exponential";
subplot(3,1,1); plot(t, xa_1, 'b'); title('Time Signal x_a(t) = A e^{-at} u(t)'); xgrid();
subplot(3,1,2); plot(F, Xa_1_mag, 'r'); title('Magnitude Spectrum |X_a(F)|'); xgrid();
subplot(3,1,3); plot(F, Xa_1_phase, 'm'); title('Phase Spectrum \angle X_a(F)'); xgrid();;

// --- Problem 4.2 (b): Two-Sided Exponential ---
xa_2 = A * exp(-a * abs(t));
Xa_2_mag = (2 * A * a) ./ (a^2 + (2 * %pi * F).^2);
Xa_2_phase = zeros(F); // Strictly positive real spectrum = 0 phase

scf(1); clf();
f = gcf(); f.figure_name = "Problem 4.2(b): Two-Sided Exponential";
subplot(3,1,1); plot(t, xa_2, 'b'); title('Time Signal x_a(t) = A e^{-a|t|}'); xgrid();
subplot(3,1,2); plot(F, Xa_2_mag, 'r'); title('Magnitude Spectrum |X_a(F)|'); xgrid();
// Using strict axis bounds so the flat zero-phase line is visible
subplot(3,1,3); plot(F, Xa_2_phase, 'm'); title('Phase Spectrum \angle X_a(F)'); 
gca().data_bounds = [min(F), -%pi/2; max(F), %pi/2]; xgrid();
