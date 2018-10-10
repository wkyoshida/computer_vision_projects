%%%%%%%%%%%%%  Function emptyarray %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Set up an MxN image full of zeros
%
% Input Variables:
%      M, N    rows (M) and columns (N) for the desired image
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      
% Returned Results:
%      emptyimage  new image full of all zero's
%
% Processing Flow:  
%      1.  Cycle through MxN array and fill with zero's
%
%  The following functions are called:
%      NONE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [emptyimage] = emptyarray(M,N)
for x = 1 : M        
    for y = 1 : N    
        emptyimage(x,y) = 0;
    end
end