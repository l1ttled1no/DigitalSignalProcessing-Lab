function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    // 1. Determine the time boundaries for both signals
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    // 2. Define the universal time range
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min : n_max;
    
    // 3. Initialize padded signals with zeros
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    
    // 4. Insert original signals into the padded vectors
    // Find the starting position in the 'ny' vector for each signal
    pos1 = find(ny == min(n1));
    y1(pos1 : pos1 + length(x1n) - 1) = x1n;
    
    pos2 = find(ny == min(n2));
    y2(pos2 : pos2 + length(x2n) - 1) = x2n;
    
    // 5. Addition
    yn = y1 .* y2;
    yorigin = find(ny == 0); // Find where n=0 is in the new vector
    
    // 6. Graphical Display
    clf();
    subplot(3,1,1);
    plot2d3('gnn', ny, y1); plot(ny, y1, 'ro');
    xtitle("Signal x1(n)", "n", "Amp"); xgrid();
    
    subplot(3,1,2);
    plot2d3('gnn', ny, y2); plot(ny, y2, 'bo');
    xtitle("Signal x2(n)", "n", "Amp"); xgrid();
    
    subplot(3,1,3);
    plot2d3('gnn', ny, yn); plot(ny, yn, 'go');
    xtitle("Result y(n) = x1.x2", "n", "Amp"); xgrid();
endfunction
[yn, yorigin] = multi([1, 2, 3, 4], 2, [3, 4, 5, 6], 3);
