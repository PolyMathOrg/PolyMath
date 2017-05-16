Not Final version, still in progress.

Singular Value Decomposition method.
https://en.wikipedia.org/wiki/Singular_value_decomposition

M = U*S*V

Input: 
 -  M - m x n matrix of real numbers.
Output: 
 -  U m x m unitary matrix.
 -  V n x n unitary matrix.
 -  s - diagonal of the diagonal matrix S.
 -  s_matrix - matrix S 
Example:
[ [ [ 
matrix := PMMatrix rows: #(
			(1 2 3 4)
			(5 6 7 8)
		     ).			
u := PMSingularValueDecomposition getLeftMatrix: matrix.
v := PMSingularValueDecomposition getRightMatrix: matrix.
s := PMSingularValueDecomposition  getDiagonal: matrix.
s_matrix := PMSingularValueDecomposition  getSMatrix: matrix.
 ] ] ]

