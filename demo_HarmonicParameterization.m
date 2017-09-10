clear all; clc; close all;
addpath(genpath('.'));

filename = 'CYHo';


%%
fprintf('Read mesh file ...                      ');tic
load(filename);
toc

fprintf('Plot the mesh model ...                 ');tic
figure
if exist('Vrgb', 'var')
    PlotMesh(F, V, Vrgb);
else
    PlotMesh(F, V);
end
toc

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

