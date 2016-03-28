double dispatching
transposeProductWithMatrix: aMatrix
	"Answers the product of the transpose of the receiver with aMatrix (in this order)."
	"speed optimized"
	|t|
	t :=aMatrix privateTranspose.
	^ DhbMatrix rows: (self columnsCollect: [ :row | t rowsCollect: [ :col | row * col]])