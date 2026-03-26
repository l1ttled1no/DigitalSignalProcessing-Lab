function [yn, yorigin] = delay(xn, xorigin, k)
    // 1. Calculate the new origin position
    // Shifting x(n-k) moves the origin index back by k
    yorigin = xorigin - k;
    yn = xn; // The values in the vector remain the same
    
    // 2. Determine time axes for plotting
    // Signal x starts at 1-xorigin and ends at length(xn)-xorigin
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    // 3. Graphical Display
    clf();
    // Plot Original x(n)
    subplot(2,1,1);
    plot2d3('gnn', nx, xn);
    plot(nx, xn, 'ro');
    xtitle("Original Signal x(n)", "n", "Amplitude");
    xgrid();
    
    // Plot Delayed y(n)
    subplot(2,1,2);
    plot2d3('gnn', ny, yn);
    plot(ny, yn, 'bo');
    xtitle("Delayed Signal y(n) = x(n - "+string(k)+")", "n", "Amplitude");
    xgrid();
    
    printf("Original Origin: %d\n", xorigin);
    printf("New Origin (yorigin): %d\n", yorigin);
endfunction

//[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);
