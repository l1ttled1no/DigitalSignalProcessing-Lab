// Define the frequency axis from -pi to pi
w = -%pi:0.01:%pi;

// ==========================================
// Signal A: x1(n) = 0.1^n * u(n)
// ==========================================
X1 = 1 ./ (1 - 0.1 * exp(-%i * w));

mag1 = abs(X1);
phase1 = atan(imag(X1), real(X1));

figure(1);
clf;
subplot(2,1,1);
plot(w, mag1);
title('Amplitude Spectrum of x1(n) = 0.1^n u(n)');
xlabel('\omega (radians)'); ylabel('|X1(\omega)|');

subplot(2,1,2);
plot(w, phase1);
title('Phase Spectrum of x1(n)');
xlabel('\omega (radians)'); ylabel('\angle X1(\omega) (radians)');

// ==========================================
// Signal B: x2(n) = 4-sample pulse
// ==========================================
X2 = 1 + exp(-%i * w) + exp(-%i * 2 * w) + exp(-%i * 3 * w);

mag2 = abs(X2);
phase2 = atan(imag(X2), real(X2));

figure(2);
clf;
subplot(2,1,1);
plot(w, mag2);
title('Amplitude Spectrum of x2(n) = \delta(n) + \delta(n-1) + \delta(n-2) + \delta(n-3)');
xlabel('\omega (radians)'); ylabel('|X2(\omega)|');

subplot(2,1,2);
plot(w, phase2);
title('Phase Spectrum of x2(n)');
xlabel('\omega (radians)'); ylabel('\angle X2(\omega) (radians)');
