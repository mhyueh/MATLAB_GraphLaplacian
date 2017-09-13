clear;clc;close all;
addpath(genpath('.'));

% Load the edgelist
E = LoadGraph();

% Construct the adjacency matrix
A = GraphAdjacency(E);

% Plot the sparsity of A
fprintf('Plot the sparsity of the graph ...      ');tic
h = figure;
spy(A);
toc
fprintf('Close the figure to continue ... \n');
waitfor(h);


% Construct the graph Laplacian Matrix
L = GraphLaplacian(A);

% Solve the graph embedding problem
[EV, EW] = eigs(L, 4, 'SA');
XY = EV(:,2:4);

% Plot the result
PlotGraph(E, XY);