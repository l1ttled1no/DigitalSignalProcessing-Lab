// Define the frequency axis from -pi to pi
w = -%pi:0.01:%pi;

// Define system H and input X
H = 1 + exp(-%i * w);
X = 1 ./ (1 - 0.5 * exp(-%i * w));

// Calculate Output Y
Y = H .* X;

// Extract magnitude and phase
magY = abs(Y);
phaseY = atan(imag(Y), real(Y));

// Plotting
figure(1);
clf;
subplot(2,1,1);
plot(w, magY);
title('Amplitude Spectrum of Output Y(\omega)');
xlabel('\omega (radians)'); ylabel('|Y(\omega)|');

subplot(2,1,2);
plot(w, phaseY);
title('Phase Spectrum of Output Y(\omega)');
xlabel('\omega (radians)'); ylabel('\angle Y(\omega) (radians)');
