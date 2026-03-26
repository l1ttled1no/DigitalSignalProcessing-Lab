// --- SETUP PARAMETERS ---
A = 3; 
F0 = 50; 
Fs = 300;
N = 6;              // Our calculated period
num_periods = 5;    // We need 5 periods for the assignment

// 1. DRAWING THE ANALOG SIGNAL (xa)
// We create 1000 points to make the line look "smooth" like an analog signal
t_analog = linspace(0, num_periods * (1/F0), 1000); 
xa = A * sin(100 * %pi * t_analog);

// 2. DRAWING THE DISCRETE SIGNAL (x_n)
// Here, we only take points at integer steps (0, 1, 2...)
// 5 periods * 6 samples per period = 30 samples total
n = 0 : (num_periods * N); 
x_n = A * sin(100 * %pi * n * (1/Fs));

// 3. DRAWING THE QUANTIZED SIGNAL (xq_n)
// 'fix' is the Scilab command for truncation (rounding toward zero)
xq_n = fix(x_n);

// --- PLOTTING ---
clf(); // Clear any old drawings

// Subplot 1: Analog
subplot(3,1,1);
plot(t_analog, xa, 'r'); // 'r' makes the line red
xtitle("Analog Signal xa(t)", "Time (s)", "Amplitude");

// Subplot 2: Discrete
subplot(3,1,2);
plot2d3('gnn', n, x_n); // 'plot2d3' draws the vertical "stems"
plot(n, x_n, 'ro');     // Adds red circles at the top of the stems
xtitle("Discrete Signal x(n) (Periodic N=6)", "n (samples)", "Amplitude");

// Subplot 3: Quantized
subplot(3,1,3);
plot2d3('gnn', n, xq_n); 
plot(n, xq_n, 'bo');     // Adds blue circles
xtitle("Quantized Signal xq(n) (Truncated)", "n (samples)", "Amplitude");
