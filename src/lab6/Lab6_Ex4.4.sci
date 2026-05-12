// --- Problem 4.4 Setup ---
xn_period = [3, 2, 1, 0, 1, 2]; // One period of the signal
N = length(xn_period);

// --- Compute DFS Coefficients (Part a) ---
// Scilab's fft() computes the unnormalized DFT, so we divide by N for the DFS ck
ck = fft(xn_period) / N;

// Extract magnitude and phase
mag_ck = abs(ck);
phase_ck = atan(imag(ck), real(ck)); 
// Clean up tiny numerical noise (e.g., 1e-16) to strict 0 for phase
phase_ck(abs(phase_ck) < 1e-10) = 0; 

// --- Setup indices for plotting ---
k = 0:N-1; // Frequency index
n_plot = -6:6; // Extended time index for sketching multiple periods
xn_plot = zeros(1, length(n_plot));

// Repeat the period to cover n = -6 to 6
for i = 1:length(n_plot)
    // modulo math handles the negative indices wrapping correctly
    idx = pmodulo(n_plot(i), N) + 1; 
    xn_plot(i) = xn_period(idx);
end

// --- Plotting Sketches ---
scf(0); clf();

// 1. Sketch x(n)
subplot(3,1,1);
plot2d3('gnn', n_plot, xn_plot); plot(n_plot, xn_plot, 'ro');
title('Periodic Signal x(n)');
xlabel('Time Index (n)'); ylabel('Amplitude');
xgrid();

// 2. Sketch Magnitude Spectrum
subplot(3,1,2);
plot2d3('gnn', k, mag_ck); plot(k, mag_ck, 'bo');
title('Magnitude Spectrum |c_k|');
xlabel('Frequency Index (k)'); ylabel('Magnitude');
xgrid();

// 3. Sketch Phase Spectrum
subplot(3,1,3);
plot2d3('gnn', k, phase_ck); plot(k, phase_ck, 'mo');
title('Phase Spectrum ∠c_k');
xlabel('Frequency Index (k)'); ylabel('Phase (radians)');
// Set strict Y-axis limits so a straight line at 0 is visible
gca().data_bounds = [0, -%pi; 5, %pi]; 
xgrid();

// --- Verify Parseval's Relation (Part b) ---
P_time = sum(xn_period.^2) / N;
P_freq = sum(mag_ck.^2);

disp("--- Parseval''s Relation Verification ---");
disp("Power in Time Domain (P_time): " + string(P_time));
disp("Power in Freq Domain (P_freq): " + string(P_freq));
if abs(P_time - P_freq) < 1e-10 then
    disp("Result: Match Confirmed!");
end
