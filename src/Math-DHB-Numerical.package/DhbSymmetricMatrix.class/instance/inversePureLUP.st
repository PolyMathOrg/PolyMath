operation
inversePureLUP
		"Answer the inverse of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	lupDecomposition := nil.
	^self class rows: lupDecomposition inverseMatrixComponents