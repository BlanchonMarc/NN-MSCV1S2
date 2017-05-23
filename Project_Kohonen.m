%% RESET

clear all;
close all;
clc;

%% FIRST PART

%Input matrix for the classifier
input_matrix =  [1 1 0 0; 
                0 0 0 1;
                1 0 0 0;
                0 0 1 1];


%Parameters / Same as used in the slides or inputs
prompt = 'Learning rate : ';% learning rate
alpha = input(prompt)
prompt = 'Learning radius : ';% learning radius
R = input(prompt)
prompt = 'Number of iterations : ';% learning radius
iterations = input(prompt)

%Uncomment for the values of the slides
%alpha=0.6; 
%R=0; % learning radius
%iterations=300; % number of iterations

%Determination of the final weight matrix
Weight_matrix = TrainClassifier(input_matrix , alpha , R , iterations)


testing_matrix=[0 0 0 0.9; 0 0 0.8 0.9; 0.7 0 0 0; 0.7 0.9 0 0]

KohonenClustering( testing_matrix , Weight_matrix )

disp('Press any key to continue in Part II !')  % Press a key here.You can see the message 'Paused: Press any key' in        % the lower left corner of MATLAB window.
pause;

%% SECOND PART


delimiter = '	'; % Delimiter

% Treatement of the input data
filename_control = 'control.txt';
control = importdata(filename_control,delimiter);

filename_patient = 'patient.txt';
patient = importdata(filename_patient,delimiter);

%Concatenate the two text files as one matrix
input_matrix=[control;patient];


%Parameters / Same as used in the slides or inputs
prompt = 'Learning rate : ';% learning rate
alpha = input(prompt)
prompt = 'Learning radius : ';% learning radius
R = input(prompt)
prompt = 'Number of iterations : ';% learning radius
iterations = input(prompt)

%Uncomment for the values of the slides
%alpha=0.6; 
%R=0; % learning radius
%iterations=300; % number of iterations

%Determination of the final weight matrix
Weight_matrix = TrainClassifier(input_matrix , alpha , R , iterations)


filename_clustering = 'yamid.txt';
delimiter = '	';
testing_matrix = importdata(filename_clustering,delimiter);

KohonenClustering( testing_matrix , Weight_matrix )

disp('Press any key to end !')  % Press a key here.You can see the message 'Paused: Press any key' in        % the lower left corner of MATLAB window.
pause;


