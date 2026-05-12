// Scilab Script for Problem 4.3: Triangular Pulse Spectra
tau = 1; // Arbitrary pulse width parameter (you can change this)

// Frequency and Time axes
F = -5:0.01:5; 
t = -2.5:0.01:2.5;

// --- 1. Time-Domain Signal ---
// Vectorized calculation for 1 - |t|/tau where |t| <= tau
xt = (1 - abs(t) / tau) .* (abs(t) <= tau);

// --- 2. Frequency-Domain Spectra ---
// Note: Scilab's built-in sinc(x) function calculates sin(pi*x) / (pi*x)
Xa_mag = tau * (sinc(F * tau)).^2;
Xa_phase = zeros(F); // The squared sinc function is always positive, so phase is 0

// --- 3. Plotting ---
scf(2); clf();
f = gcf(); f.figure_name = "Problem 4.3: Triangular Pulse";

subplot(3,1,1); 
plot(t, xt, 'b', 'LineWidth', 2); 
title('Time Signal x(t)'); 
xlabel('Time (t)');
xgrid();

subplot(3,1,2); 
plot(F, Xa_mag, 'r', 'LineWidth', 2); 
title('Magnitude Spectrum |X_a(F)| = \tau sinc^2(F\tau)'); 
xlabel('Frequency F (Hz)');
xgrid();

// Using strict axis bounds so the flat zero-phase line is clearly visible
subplot(3,1,3); 
plot(F, Xa_phase, 'm', 'LineWidth', 2); 
title('Phase Spectrum \angle X_a(F) = 0'); 
xlabel('Frequency F (Hz)');
gca().data_bounds = [min(F), -%pi/2; max(F), %pi/2]; 
xgrid();
