transformation
matrixForLeftSide: aMatrix
	"comment stating purpose of message"

	| transposeMatrix |
	transposeMatrix :=  aMatrix transpose.
	^ transposeMatrix transposeProductWithMatrix: transposeMatrix.