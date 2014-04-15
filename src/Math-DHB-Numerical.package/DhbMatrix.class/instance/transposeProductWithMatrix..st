double dispatching
transposeProductWithMatrix: aMatrix
		"Answers the product of the transpose of the receiver with aMatrix (in this order).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
		"speed optimized"
		|t|
		t :=aMatrix privateTranspose .
	^DhbMatrix  rows: ( self columnsCollect: [ :row | t rowsCollect: [ :col | row * col]])