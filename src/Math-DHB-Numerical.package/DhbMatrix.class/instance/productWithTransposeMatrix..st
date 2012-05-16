double dispatching
productWithTransposeMatrix: aMatrix
		"Answers the product of the receiver with the transpose of aMatrix(in this order).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^self class rows: ( self rowsCollect: [ :row | aMatrix rowsCollect: [ :col | row * col]])