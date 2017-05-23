function [ Weight_Matrix ] = TrainClassifier( input_matrix , alpha , R , iterations )
%TRAINCLASSIFIER 
%   - input_matrix = training matrix / input
%   - alpha and R = parameters for the classifier ( corresponding learning
%   rate and learning radius ) Learning radius is not used in this
%   application
%   - iterations = number of iterations ( accuracy )
%   ---------------------------------------------------------------------
%   This function allow to train a classifier in the goal of returning a weight matrix that can represent the clustering method.
%   In this function we only take care of the weight update but we
%   initialize it automatically directly using the DetermineWeight
%   function.
%   
%   For every iterations ( accuracy )(#1) and for each rows of the
%   input_matrix (#2) we create a vector corresponding to the size of
%   columns of the weight matrix.
%   Now for every column of the Weight_matrix (#3) and for every column of the input (#4)
%   we calculate the euclidian distance between each element of the input
%   and the correspondant weight in the goal of finding the minimum
%   distance. 
%   After this process of the loop #2 we update the weight matrix using the
%   equation at the specidif index of the finded minima. And for every
%   iterations we divide the learning rate by two.
%   It's a straight following of the process of Training.
%   ---------------------------------------------------------------------
%   To be clear the usage of this function is just inputing a generic value
%   matrix, beeing able to calculate an initial weight and update this
%   weight matrix to after it being able to classify a set of multiple
%   data.

Weight_Matrix = DetermineWeight(input_matrix);


for it = 1:iterations %(#1) Iterations
for i = 1:size(input_matrix , 1) %(#2) Element of Matrix
    
    D = zeros(1 , size(Weight_Matrix , 2));
    
    for j = 1:size(Weight_Matrix , 2)%(#3) Member of weight matrix

        for k = 1:size(input_matrix , 2)%(#4) Member of input matrix

            D(j) = D(j) + (input_matrix(i , k) - Weight_Matrix(k , j))^2;% Euclidian Distance
        end
    end

    [Minima , Minima_index] = min(D); % Minimum distance and the index of the minimum distance

    Weight_Matrix(: , Minima_index) = Weight_Matrix(: , Minima_index) + alpha * (input_matrix(i , :)' - Weight_Matrix(: , Minima_index));  % Equation of the weight update
end

alpha = alpha / 2;
end

end

