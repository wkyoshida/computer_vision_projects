%%%%%%%%%%%%%%%%%%%  Function main %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Detect airplane objects on aerial pictures by template matching
%
% Input Variables:
%      filename    input image to detect objects
%      f_orig      read image
%      M, N, p     image parameters
%      templ_orig  original template images
%      templ       template's gradient magnitude
%      
% Returned Results:
%      f_orig       image with object matches
%      result       binary image of NCC scores
%      count        total matches
%      f            gradient magnitude of input image
%      score        NCC score array
%      result_max   post-non-maximum suppresion image   
%
% Processing Flow:  
%      1.  Read in input image file
%      2.  Smooth, grayscale, compute gradient magnitude of input image
%      3.  For every template,
%               a) read in, smooth, compute gradient magnitude
%               b) perform and save NCC scores
%               c) fill in result binary image with pixels of interest
%      4.  Perform non-maximum suppression
%      5.  Get total count and coordinates for matches
%      6.  Mark and enumerate matches on image
%      7.  Display intermediate and final results
%
%  The following functions are called:
%      emptyarray()     creates empty image
%      gradient_mag()   smooths, grayscale, compute gradient magnitude
%      normxcorr2()     computes NCC scores
%      imresize()       resizes image
%      bwmorph()        performs morphological operations
%      insertShape()    insert shapes on image
%      insertText()     insert text on image
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function main(filename)

% Read in input image and get diameters
f_orig = imread(filename);
[M, N, p] = size(f_orig);

% Initialize data recording variables and binary image
result = emptyarray(M,N);
matches_coord = [];
count = 0;

% Smooth, grayscale, and compute gradient magnitude of image
f = gradient_mag(f_orig);

% For all templates,
%   Read in, smooth and compute gradient magnitude
F = dir('templateplane_*.jpg'); 

for ii = 1 : length(F)
    fprintf("Matching template: %s\n",F(ii).name);
    templ_orig = imread(F(ii).name);
    templ = gradient_mag(templ_orig);

    % Perform NCC and save scores
    score = normxcorr2(templ, f);
    score = imresize(score,[M N]);

    % Cycle through NCC score
    %   create binary image from pixels of interest
    for x = 1 : M        
        for y = 1 : N    
            if score(x,y) >= 0.2 % Score threshold
                result(x,y) = 1;
            end
        end
    end
end

% Perform non-maximal suppresion
result_max = bwmorph(result,'shrink',Inf);

% Get count of and coordinates for matches
for i = 1 : M
    for j = 1 : N
        if result_max(i,j) == 1
            matches_coord = [matches_coord; [j i 10]];
            count = count + 1;
        end
    end
end

% Graphic overlay - mark and enumerate matches

f_orig = insertShape(f_orig,'circle',matches_coord,'LineWidth',5,'Color','red');
f_orig = insertText(f_orig,[N/2 M/2],[count]);

for i = 1 : count
    f_orig = insertText(f_orig,[matches_coord(i,1) matches_coord(i,2)],[i]);
end

% Display intermediate and final results

imtool(templ_orig); % example template
imtool(templ); % template gradient magnitude
imtool(f); % gradient magnitude
imtool(score); % NCC scores
imtool(result); % binary image of NCC scores
imtool(result_max); % post non-max suppression
imtool(f_orig); % final result
