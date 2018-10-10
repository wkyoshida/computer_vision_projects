%%%%%%%%%%%%%  Function gradient_mag %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform operations to smooth and calculate 
%             gradient magnitude of an image
%
% Input Variables:
%      f_orig  input image
%      
% Returned Results:
%      f       image after image-processing operations
%      Gmag    gradient magnitude array
%      Gdir    gradient direction array
%
% Processing Flow:  
%      1.  Smooth
%      2.  Convert to grayscale
%      3.  Calculate gradient magnitude
%
%  The following functions are called:
%      imgaussfilt()    Performs Gaussian smoothing
%      rgb2gray()       Converts to grayscale
%      imgradient()     Calculates gradient magnitude
%      mat2gray()       Converts magnitude to grayscale
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [f] = gradient_mag(f_orig)

f = imgaussfilt(f_orig,[2 1]); % Gaussian smoothing
f = rgb2gray(f_orig); % Grayscale
[Gmag, Gdir] = imgradient(f,'sobel'); % Gradient magnitude with Sobel edge operator
f = mat2gray(Gmag);