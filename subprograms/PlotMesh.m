function PlotMesh(F, V, Vrgb)

if nargin == 2
    switch size(V,2)
        case 2
            trimesh(F, V(:,1), V(:,2), 0*V(:,1));
        case 3
            trisurf(F, V(:,1), V(:,2), V(:,3));
    end
    colormap([176/255 224/255 230/255]);
    shading interp
    light('Position',[0 0 1]);
else
    patch('Faces', F, 'Vertices', V, 'FaceVertexCData', (Vrgb), 'EdgeColor','interp','FaceColor','interp');
end
set(gcf, 'color', [0 0 0]); 
view([0, 0, 1]);
axis equal off

