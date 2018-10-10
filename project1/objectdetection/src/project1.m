%%%%%%%%%%%%%%%%%%%%%%%  Project 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Routine to prompt the user for a desired input image
%
% Input Variables:
%      file_name    input image
%
% Processing Flow:  
%      1.  Prompt the user for image
%      2.  Call main with desired image as parameter
%
%  The following functions are called:
%      main
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; % Clear memory

file_name = input('Input: what is the image filename?: ','s');

main(file_name);