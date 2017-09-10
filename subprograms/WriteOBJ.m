function WriteOBJ(filename, V, F, Vrgb)

fid = fopen(filename,'wt');
fprintf(fid, '# %d vertex\n', size(V,1));
if nargin == 4
    if size(Vrgb,2) == 1
        fprintf(fid, 'v %f %f %f %f %f %f\n', [V, Vrgb, Vrgb, Vrgb].');
    else
        fprintf(fid, 'v %f %f %f %f %f %f\n', [V, Vrgb].');
    end
else
    fprintf(fid, 'v %f %f %f\n', V');
end
fprintf(fid, '# %d faces\n', size(F,1));
fprintf(fid, 'f %d %d %d\n', F');
fclose(fid);

end