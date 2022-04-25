Class {
	#name : #PMLeastSquares,
	#superclass : #Object,
	#category : #'Math-Numerical'
}

{ #category : #'as yet unclassified' }
PMLeastSquares >> solveMatrixA: aPMMatrix vectorB: aPMVector [

	"SVD-based implementation of a minimum-norm solution to the overdetermined least squares problem.
	minimize || b - Ax ||"

	| svd u s v pseudoinverse |
	svd := PMSingularValueDecomposition decompose: aPMMatrix.

	u := svd leftSingularMatrix.
	s := svd diagonalSingularValueMatrix.
	v := svd rightSingularMatrix.

	pseudoinverse := s inverse.

	^ v * pseudoinverse * u transpose * aPMVector
]
