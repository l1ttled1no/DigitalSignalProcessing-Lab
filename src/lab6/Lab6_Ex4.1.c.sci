// Define signal parameters
A = 1;      // Set peak amplitude
tau = 1;    // Set fundamental period

// --- 1. Time-Domain Signal Plot ---
t = -tau : 0.001 : 2*tau; // Time vector matching Fig P4.1
xa = A * abs(sin(%pi * t / tau));

scf(0); clf(); // Open new figure window
subplot(2,1,1);
plot(t, xa, 'b', 'LineWidth', 2);
xgrid();
title('Fig P4.1: Full-Wave Rectified Sinusoid $x_a(t)$');
xlabel('Time (t)');
ylabel('Amplitude');

// --- 2. Power Spectral Density (PSD) Plot ---
k = -5:5;          // Compute for harmonics from -5 to 5
F = k / tau;       // Frequencies (Hz)
Pk = (4 * A^2) ./ ((%pi^2) * (1 - 4 * k.^2).^2); // Power of each harmonic

subplot(2,1,2);
// Use plot2d3 to create a discrete stem plot for the line spectrum
plot2d3('gnn', F, Pk); 
plot(F, Pk, 'ro'); // Add red dots at the peaks
xgrid();
title('Power Spectral Density (Line Spectrum)');
xlabel('Frequency F (Hz)');
ylabel('Power $P_k$');
