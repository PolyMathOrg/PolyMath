"
SVD-based implementation of a minimum-norm solution to the overdetermined least squares problem.
"
Class {
	#name : #PMLeastSquares,
	#superclass : #Object,
	#category : #'Math-Numerical'
}

{ #category : #accessing }
PMLeastSquares >> pseudoinverseOfDiagonal: aMatrix [

	"To get pseudoinverse of a diagonal rectangular matrix, we take reciprocal of any no-zero
	element of the main diagonal, leaving all zeros in place. Then we transpose the matrix."

	| pseudoinverse diagonalSize |
	"Rows become columns and columns become rows because we transpose"
	pseudoinverse := PMMatrix zerosRows: aMatrix numberOfColumns cols: aMatrix numberOfRows.

	"The size of the main diagonal of a rectangular matrix is its smallest dimension"
	diagonalSize := aMatrix numberOfRows min: aMatrix numberOfColumns.

	"Inverting the elements on the main diaginal"
	1 to: diagonalSize do: [ :i | 
		pseudoinverse at: i at: i put: ((aMatrix at: i at: i) = 0 ifTrue: [ 0 ]
				 ifFalse: [ 1 / (aMatrix at: i at: i) ]) ].

	^ pseudoinverse
]

{ #category : #api }
PMLeastSquares >> solveMatrixA: aMatrix matrixB: aMatrixOrVector [

	"If b is a vector:
	x' = minimize || b - Ax ||
	
	If B is a matrix:
	X' = minimize || B - AX ||"

	| svd u s v pseudoinverse |
	svd := PMSingularValueDecomposition decompose: aMatrix.

	u := svd leftSingularMatrix.
	s := svd diagonalSingularValueMatrix.
	v := svd rightSingularMatrix.

	pseudoinverse := self pseudoinverseOfDiagonal: s.
	^ v * pseudoinverse * u transpose * aMatrixOrVector
]
