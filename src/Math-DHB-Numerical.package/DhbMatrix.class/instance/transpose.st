information
transpose
		"Answer a new matrix, transpose of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^self class rows: ( self columnsCollect: [ :each | each])