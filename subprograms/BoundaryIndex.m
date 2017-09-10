function [VB, VI] = BoundaryIndex(F)
Vno = max(max(F));
Gvv = sparse(F, F(:,[2 3 1]), 1, Vno, Vno);
Gb  = Gvv - Gvv';
[Bi, Bj] = find( Gb == 1 );
VBno = numel(Bi);
VB   = zeros(VBno, 1);
[bd_vertex, bd_ind] = min(Bi);
for jj = 1:VBno
    VB(jj) = bd_vertex;
    bd_ind = find( Bi == Bj(bd_ind) );
    bd_vertex = Bi(bd_ind);
    if ( bd_vertex == VB(1) ) && ( jj ~= VBno );
        VBno = jj;
        VB(jj+1:end) = [];
        break
    end
end
if nargout > 1
    VI = setdiff((1:Vno).', VB);
end