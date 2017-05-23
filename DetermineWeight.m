function [ Weight_matrix ] = DetermineWeight( input_matrix )
%DETERMINEWEIGHT 
%   input_matrix = training matrix
%   Weight_matrix = returned first generic weight matrix
%   -----------------------------------------------------------------------
%   Take the max value of any dimension input matrix and randomize two
%   values for each rows of the input between 0 and the max value.

Weight_matrix(:,:)=max(max(input_matrix)) * rand(size(input_matrix,2),2);

% max(max()) to extract the any dimension maxima
% rand() to randomize as natural number between 0 and 1, and mlultiply by
% the max

end

