function [ Clusters ] = KohonenClustering( Input_matrix , Weight_matrix )
%KOHONENCLUSTERING 
%   - Input_matrix = Matrix to test
%   - Weight_matrix = updated weight matrix
%   - Clusters = Each column of this vector correspond to the cluster
%   identified for each rows of the input matrix
%   ----------------------------------------------------------------------
%   Create an ouput vector , determine for every elelment the euclidian
%   distance and make correspondance between the rows ( elements ) and the
%   clusters. This function allow to make clusters on a database matrix
%   using a previously computed weight matrix from a training matrix.

    Clusters = zeros(1 , size(Weight_matrix , 2)); % create the ouput vector

    for i = 1 : size(Input_matrix , 1) % for each rows of the input

        D = zeros(1 , size(Weight_matrix,2));

        for j = 1 : size(Weight_matrix , 2) % for each column of the weight matrix
            for k = 1 : size(Input_matrix , 2) % for each column of input matrix
                
                D(j) = D(j) + (Input_matrix(i,k) - Weight_matrix(k , j))^2; % Compute Euclidian distance
                
            end
        end

        [Minima , Minima_index] = min(D); % Determine the minimal euclidian distance and the index of the cluster
        Clusters(i) = Minima_index; % ouput of the function / clusters

    end


end

