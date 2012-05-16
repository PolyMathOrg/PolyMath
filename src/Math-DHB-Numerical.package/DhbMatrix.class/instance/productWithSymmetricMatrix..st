double dispatching
productWithSymmetricMatrix: aSymmetricMatrix
		"Answers the product of the receiver with aSymmetricMatrix (in this order).
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^self class rows: ( self rowsCollect: [ :row | aSymmetricMatrix columnsCollect: [ :col | row * col]])