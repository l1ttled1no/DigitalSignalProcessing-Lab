// Scilab script to compute and sketch DTFT for Problem 4.9 parts (a), (f), and (g)

// Define the continuous frequency axis from -pi to pi
w = linspace(-%pi, %pi, 1000);

// ==========================================
// Part (a): x(n) = u(n) - u(n-6)
// This is a rectangular pulse of length 6.
// ==========================================
n_a = 0:5; // Non-zero only for n = 0, 1, 2, 3, 4, 5
x_a = ones(1, 6);

// Compute DTFT: X(w) = sum(x * exp(-j*w*n))
X_a = x_a * exp(-%i * n_a' * w);

scf(0); clf();
f = gcf(); f.figure_name = "Part (a) Spectra";
subplot(2,1,1); 
plot(w, abs(X_a), 'b', 'LineWidth', 2);
title('Magnitude Spectrum |X_a(\omega)|'); xlabel('\omega (radians)'); xgrid();

subplot(2,1,2); 
plot(w, atan(imag(X_a), real(X_a)), 'r', 'LineWidth', 2);
title('Phase Spectrum \angle X_a(\omega)'); xlabel('\omega (radians)'); xgrid();

// ==========================================
// Part (f): x(n) = 2 - (1/2)|n|, for |n| <= 4
// (Note: Using |n| as it creates the standard symmetric triangular 
// window typical of this textbook's problems).
// ==========================================
n_f = -4:4;
x_f = 2 - 0.5 * abs(n_f); 

X_f = x_f * exp(-%i * n_f' * w);

// Clean up floating-point noise for a perfectly symmetric (real) spectrum
phase_f = atan(imag(X_f), real(X_f));
phase_f(abs(phase_f) < 1e-10) = 0; 

scf(1); clf();
f = gcf(); f.figure_name = "Part (f) Spectra";
subplot(2,1,1); 
plot(w, abs(X_f), 'b', 'LineWidth', 2);
title('Magnitude Spectrum |X_f(\omega)|'); xlabel('\omega (radians)'); xgrid();

subplot(2,1,2); 
plot(w, phase_f, 'r', 'LineWidth', 2);
title('Phase Spectrum \angle X_f(\omega)'); xlabel('\omega (radians)'); 
gca().data_bounds = [min(w), -%pi; max(w), %pi]; // Force axis to show the flat 0 line clearly
xgrid();

// ==========================================
// Part (g): x(n) = {-2, -1, 0, 1, 2} 
// The arrow is at 0, making this an odd/anti-symmetric sequence.
// ==========================================
n_g = -2:2;
x_g = [-2, -1, 0, 1, 2];

X_g = x_g * exp(-%i * n_g' * w);

// The phase will strictly jump between pi/2 and -pi/2 because the spectrum is purely imaginary
phase_g = atan(imag(X_g), real(X_g));

scf(2); clf();
f = gcf(); f.figure_name = "Part (g) Spectra";
subplot(2,1,1); 
plot(w, abs(X_g), 'b', 'LineWidth', 2);
title('Magnitude Spectrum |X_g(\omega)|'); xlabel('\omega (radians)'); xgrid();

subplot(2,1,2); 
plot(w, phase_g, 'r', 'LineWidth', 2);
title('Phase Spectrum \angle X_g(\omega)'); xlabel('\omega (radians)'); xgrid();
