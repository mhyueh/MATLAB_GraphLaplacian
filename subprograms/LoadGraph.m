function [E, filename] = LoadGraph()
[filename, pathname] = uigetfile({'*.*','Supported mesh file'}, 'Pick an edge list file');
E = load( [pathname filename] );