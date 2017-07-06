addpath(genpath('.'));

% Load the edgelist
E = load('dodecahedron.txt');

% Construct the adjacency matrix
A = GraphAdjacency(E);

% Construct the graph Laplacian Matrix
L = GraphLaplacian(A);

% Solve the graph embedding problem
[EV, EW] = eig(full(L));
XY = EV(:,2:4);

% Plot the result
PlotGraph(E, XY);