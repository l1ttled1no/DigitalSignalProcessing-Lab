function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // 1. Perform the mathematical convolution
    // convol() handles the sum of products for us
    yn = convol(xn, hn);
    
    // 2. Calculate the new origin position
    // Formula: Index of y(0) = Index of x(0) + Index of h(0) - 1
    yorigin = xorigin + horigin - 1;
    
    // 3. Define time axes for plotting
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    
    // 4. Graphical Display
    clf();
    
    // Plot Input x(n)
    subplot(3,1,1);
    plot2d3('gnn', nx, xn); plot(nx, xn, 'ro');
    xtitle("Input Signal x(n)", "n", "Amp"); xgrid();
    
    // Plot Impulse Response h(n)
    subplot(3,1,2);
    plot2d3('gnn', nh, hn); plot(nh, hn, 'bo');
    xtitle("Impulse Response h(n)", "n", "Amp"); xgrid();
    
    // Plot Result y(n)
    subplot(3,1,3);
    plot2d3('gnn', ny, yn); plot(ny, yn, 'go');
    xtitle("Convolution Result y(n) = x(n)*h(n)", "n", "Amp"); xgrid();
    
    printf("Resulting Origin Position (yorigin): %d\n", yorigin);
endfunction
