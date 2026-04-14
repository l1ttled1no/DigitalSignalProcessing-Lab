clc;
clear all;
// Install IPCV if not already installed
if ~atomsIsInstalled("IPCV") then
atomsInstall("IPCV");
end
// Load the toolbox
atomsLoad("IPCV");
// Read an image
img = imread("C:\Users\l1ttled1no\Pictures\Screenshots\Screenshot 2026-01-28 021636.png"); // Replace with your figure

subplot(221)
title("Original Image")
imshow(img)
img_gray = rgb2gray(img);
subplot(222)

title("Gray Scale Image")
imshow(img_gray)
[count , cells] = imhist(img_gray)
subplot(223)
title("Histogram")
plot2d3('gnn',cells ,count)


// Label the connected components in the binary image
threshold_value = 128;
img_binary = img_gray > threshold_value; // Binarize the image
[labels , num_labels] = imlabel(img_binary);
subplot(224);
imshow(labels);
title("Labeled Components");
