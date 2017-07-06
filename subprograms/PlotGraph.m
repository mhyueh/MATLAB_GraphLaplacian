function PlotGraph(E, XY)
if nargin < 2
    n = max(E(:));
    Theta = (1:n).'*2*pi/n;
    XY = [cos(Theta), sin(Theta)];
end
if size(XY,2)==2
    XY = [XY, 0*XY(:,1)];
end
trimesh(E, XY(:,1), XY(:,2), XY(:,3), 'LineWidth', 3, 'EdgeColor', 'k');
axis equal off
view([0,0,1]);

