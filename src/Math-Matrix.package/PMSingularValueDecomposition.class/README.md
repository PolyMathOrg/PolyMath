Singular Value Decomposition method.
https://en.wikipedia.org/wiki/Singular_value_decomposition

A = U * S * V transpose

Input: 
 -  A - m x n matrix 

Output: 
 -  U - m x m unitary matrix.
 -  V - n x n unitary matrix.
 -  S - diagonal matrix with singular components on the main diagonal

Example:
[ [ [ 
matrix := PMMatrix rows: #(
	(0 1 0 0)
	(0 0 2 0)
	(0 0 0 3)
	(0 0 0 0)).
	
svd := matrix decompose.
u := svd leftSingularForm.
v := svd rightSingularForm.
s := svd sForm.
 ] ] ]

