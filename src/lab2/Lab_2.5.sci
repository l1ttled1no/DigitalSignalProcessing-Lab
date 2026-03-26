// 1. Define the signal and time index
n = -1:1;
x = [1, 3, -2];

// 2. Calculate the flipped signal x(-n)
// we use -n as the index to ensure the flip is relative to n=0
x_flipped = [x(3), x(2), x(1)]; 

// 3. Calculate Even and Odd components
xe = (x + x_flipped) / 2;
xo = (x - x_flipped) / 2;

// 4. Plotting
clf();

// Original Signal
subplot(3,1,1);
plot2d3('gnn', n, x);
plot(n, x, 'ro');
title("Original Signal x(n) = {1, 3, -2}");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness=3;
xgrid();

// Even Component
subplot(3,1,2);
plot2d3('gnn', n, xe);
plot(n, xe, 'bo');
title("Even Component xe(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness=3;
xgrid();

// Odd Component
subplot(3,1,3);
plot2d3('gnn', n, xo);
plot(n, xo, 'go');
title("Odd Component xo(n)");
xlabel("n");
ylabel("Amplitude");
gca().children.children.thickness=3;
xgrid();
