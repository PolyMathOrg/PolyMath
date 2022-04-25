Class {
	#name : #PMLeastSquares,
	#superclass : #Object,
	#category : #'Math-Numerical'
}

{ #category : #'as yet unclassified' }
PMLeastSquares >> solveMatrixA: aMatrix matrixB: aMatrixOrVector [

	"SVD-based implementation of a minimum-norm solution to the overdetermined least squares problem.
	
	If b is a vector:
	x' = minimize || b - Ax ||
	
	If B is a matrix:
	X' = minimize || B - AX ||"

	| svd u s v pseudoinverse |
	svd := PMSingularValueDecomposition decompose: aMatrix.

	u := svd leftSingularMatrix.
	s := svd diagonalSingularValueMatrix.
	v := svd rightSingularMatrix.

	pseudoinverse := s inverse.

	^ v * pseudoinverse * u transpose * aMatrixOrVector
]
