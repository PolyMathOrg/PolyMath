double dispatching
productWithVector: aVector
		"Answers the product of the receiver with aVector
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^self columnsCollect: [ :each | each * aVector]