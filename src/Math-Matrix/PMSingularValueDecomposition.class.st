"
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
	
svd := matrix decomposeSV.
u := svd leftSingularForm.
v := svd rightSingularForm.
s := svd sForm.
 ] ] ]


"
Class {
	#name : #PMSingularValueDecomposition,
	#superclass : #Object,
	#instVars : [
		'diagonalSingularValueMatrix',
		'leftSingularMatrix',
		'rightSingularMatrix'
	],
	#category : #'Math-Matrix'
}

{ #category : #'instance creation' }
PMSingularValueDecomposition class >> decompose: aMatrix [
	^ self new initialize: aMatrix
]

{ #category : #accessing }
PMSingularValueDecomposition >> diagonalSingularValueMatrix [
	"Diagonal matrix S in A = USV decomposition. All elements are 0 except those on the main diagonal. The values on the diagonal are singular values of matrix A. By convention, they are sorted in descending order"

	^ diagonalSingularValueMatrix
]

{ #category : #initialization }
PMSingularValueDecomposition >> initialize: aMatrix [

	| m n symU symV eigenU eigenV diag |
	m := aMatrix numberOfRows.
	n := aMatrix numberOfColumns.
	symU := aMatrix * aMatrix transpose.
	symV := aMatrix transpose * aMatrix.

	"Expensive computation"
	eigenU := symU eigen.
	eigenV := symV eigen.
	leftSingularMatrix := (PMMatrix rows: eigenU vectors) transpose.
	rightSingularMatrix := (PMMatrix rows: eigenV vectors) transpose.
	diag := m < n
		        ifTrue: [ eigenU values ]
		        ifFalse: [ eigenV values ].
	diagonalSingularValueMatrix := PMMatrix rows: m columns: n random: 0.
	diagonalSingularValueMatrix setDiagonal: diag sqrt
]

{ #category : #accessing }
PMSingularValueDecomposition >> leftSingularForm [

	self
		deprecated: 'Use leftSingularMatrix instead'
		transformWith:'`@receiver leftSingularForm' -> '`@receiver leftSingularMatrix'.

	^ leftSingularMatrix
]

{ #category : #accessing }
PMSingularValueDecomposition >> leftSingularMatrix [
	"Matrix U in the A = USV decomposition. The columns of this matrix are the eigenvectors of the A * (A transposed) matrix (called left singular vectors). The columns of this matrix are orthonormal"

	^ leftSingularMatrix
]

{ #category : #accessing }
PMSingularValueDecomposition >> rightSingularForm [

	self
		deprecated: 'Use rightSingularMatrix instead'
		transformWith: '`@receiver rightSingularForm' -> '`@receiver rightSingularMatrix'.

	^ rightSingularMatrix
]

{ #category : #accessing }
PMSingularValueDecomposition >> rightSingularMatrix [
	"Matrix V in the A = USV decomposition. The columns of this matrix are the eigenvectors of the (A transposed) * A matrix (called right singular vectors). The columns of this matrix are orthonormal"

	^ rightSingularMatrix
]

{ #category : #accessing }
PMSingularValueDecomposition >> sForm [

	self
		deprecated: 'Use diagonalSingularValueMatrix instead'
		transformWith: '`@receiver sForm' -> '`@receiver diagonalSingularValueMatrix'.
	
	^ diagonalSingularValueMatrix
]
