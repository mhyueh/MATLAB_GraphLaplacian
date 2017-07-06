function L = GraphLaplacian(A)
D = diag(sum(A, 2));
L = D - A;