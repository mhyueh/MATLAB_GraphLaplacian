function uv = HarmonicMapping(F, V, uvB) 
Vno = size(V, 1);
L = CotangentLaplacian(F, V);
[VB, VI] = BoundaryIndex(F);
if nargin < 3
    VBvec = V(VB,:);
    VBvec = circshift(VBvec,-1) - VBvec;
    VBlen = sqrt( sum(VBvec.^2, 2) );
    CsumVBlen = cumsum(VBlen);
    s = CsumVBlen(end);
    Theta = 2 * pi* (CsumVBlen/s);
    uvB = [cos(Theta) sin(Theta)];
end

Lii =  L(VI,VI);
rhs = -L(VI,VB)*uvB;
uvI = Lii\rhs;

uv        = zeros(Vno, 2);
uv(VI, :) = uvI;
uv(VB, :) = uvB;
