// --- 1. Define Original Signal ---
x = [1, 1, 1, 1, 0.5, 0.5];
x_orig = 2; // Index 2 is n=0
n = (1:length(x)) - x_orig;

// --- 2. Window 1 Logic ---
na = n + 2;        // x(n-2)
nb = -(n - 4);     // x(4-n)
nc = n - 2;        // x(n+2)
yd = x .* bool2s(n <= 2); // x(n)u(2-n)

scf(0); // Open Window 0
clf();
subplot(2,2,1); plot2d3('gnn', na, x); plot(na, x, 'ro'); title("(a) x(n-2)"); xgrid();
subplot(2,2,2); plot2d3('gnn', nb, x); plot(nb, x, 'bo'); title("(b) x(4-n)"); xgrid();
subplot(2,2,3); plot2d3('gnn', nc, x); plot(nc, x, 'go'); title("(c) x(n+2)"); xgrid();
subplot(2,2,4); plot2d3('gnn', n, yd); plot(n, yd, 'mo'); title("(d) x(n)u(2-n)"); xgrid();

// --- 3. Window 2 Logic ---

// (e) x(n-1)delta(n-3)
ye = zeros(1, length(n));
idx_3 = find(n == 3);
ye(idx_3) = x(find(n == 2)); 

// (f) x(n^2) 
nf = -2:2;
yf = zeros(1, length(nf));
for i = 1:length(nf)
    n_sq = nf(i)^2;
    idx = find(n == n_sq);
    yf(i) = x(idx);
end

// (g & h) Even and Odd
n_sym = -4:4;
x_pad = [0, 0, 0, 1, 1, 1, 1, 0.5, 0.5]; // Padded n = -4:4
x_fold = x_pad($:-1:1);
xe = 0.5 * (x_pad + x_fold);
xo = 0.5 * (x_pad - x_fold);

scf(1); // Open Window 1
clf();
subplot(2,2,1); plot2d3('gnn', n, ye); plot(n, ye, 'ro'); title("(e) x(n-1)delta(n-3)"); xgrid();
subplot(2,2,2); plot2d3('gnn', nf, yf); plot(nf, yf, 'bo'); title("(f) x(n^2)"); xgrid();
subplot(2,2,3); plot2d3('gnn', n_sym, xe); plot(n_sym, xe, 'go'); title("(g) Even Part"); xgrid();
subplot(2,2,4); plot2d3('gnn', n_sym, xo); plot(n_sym, xo, 'mo'); title("(h) Odd Part"); xgrid();
