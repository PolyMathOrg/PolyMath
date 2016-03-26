double dispatching
productWithMatrixFinal: aMatrix
	"Answers the product of aMatrix with the receiver (in this order)."
	"speed optimized"
	|t|
	t :=self privateTranspose.
	^ DhbMatrix  rows: ( aMatrix rowsCollect: [ :row | t rowsCollect: [ :col | row * col]])