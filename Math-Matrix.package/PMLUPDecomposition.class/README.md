LUP stands for Lower, Upper and Permutation. It comes from the observation that any non-singular square matrix A can be decomposed into a product of 3 square matrices of the same dimension.

LUP decomposition is another technique to solve a
system of linear equations. It is an alternative to the Gaussian elimination. Gaussian elimination can solve a system with several constant vectors, but all constant vectors must be known before starting the algorithm.

LUP decomposition is done once for the matrix of a given system. Thus, the system can be solved for any constant vector obtained after the LUP decomposition. In addition, LUP decomposition gives a way to calculate the determinant of a matrix and it can be used to compute the inverse of a matrix.

Instance variables
- rows contains a copy of the rows of the matrix representing the system of linear equations, i.e.the matrix A; copying the matrix is necessary since LUP decomposition destroys the components; at the end of the LUP decomposition, it will contain the components of the matrices L and U,
- permutation contains an array of integers describing the permutation, i.e.the matrix P,
- parity contains parity of the permutation for efficiency purpose.

[[[
| s sol1 sol2 |
s := DhbLUPDecomposition equations: #( (3 2 4) (2 -5 -1) (1 -2 2)).
sol1 := s solve: #(16 6 10).
sol2 := s solve: #(7 10 9).
]]]