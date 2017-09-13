clear;clc;close all;
addpath(genpath('.'));

fprintf('Read mesh file ...                      ');tic
[filename, pathname] = uigetfile({'*.mat','Supported mesh file'}, 'Pick a mesh file (*.mat)');
load( [pathname filename] );
toc

fprintf('Plot the mesh model ...                 ');tic
h = figure;
if exist('Vrgb', 'var')
    PlotMesh(F, V, Vrgb);
else
    PlotMesh(F, V);
end
toc
fprintf('Close the figure to continue ... \n');
waitfor(h);

fprintf('Plot the sparsity of the graph ...      ');tic
[~, A] = CotangentLaplacian(F, V);
h = figure;
spy(A);
toc
fprintf('Close the figure to continue ... \n');
waitfor(h);

fprintf('Compute a harmonic parameterization ... ');tic
uv = HarmonicMapping(F, V); 
toc

fprintf('Plot the harmonic parameterization ...  ');tic
figure
if exist('Vrgb', 'var')
    PlotMesh(F, uv, Vrgb);
else
    PlotMesh(F, uv);
end
toc

