function [L, K] = CotangentLaplacian(F, V)
Fno = size(F,1);
Vno = size(V,1);
if size(V,2)==2
    V = [V, zeros(Vno,1)];
end
v_ki = V(F(:,1),:) - V(F(:,3),:);
v_kj = V(F(:,2),:) - V(F(:,3),:);
v_ij = V(F(:,2),:) - V(F(:,1),:);
Weight = zeros(Fno,3);
Weight(:,1) = 0.5*sum( v_ki.*v_kj,2)./sqrt(sum(cross(v_ki, v_kj).^2,2));
Weight(:,2) = 0.5*sum(-v_ij.*v_ki,2)./sqrt(sum(cross(v_ij,-v_ki).^2, 2 ) );
Weight(:,3) = 0.5*sum( v_kj.*v_ij,2)./sqrt(sum(cross(v_kj, v_ij).^2, 2 ) );
K = sparse(F, F(:,[2,3,1]), Weight, Vno, Vno);
K = K + K.';
L = diag( sum(K, 2) ) - K;
