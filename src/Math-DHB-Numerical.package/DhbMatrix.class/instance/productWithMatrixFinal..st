double dispatching
productWithMatrixFinal: aMatrix
		"Answers the product of aMatrix with the receiver (in this order).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^self class rows: ( aMatrix rowsCollect: [ :row | self columnsCollect: [ :col | row * col]])