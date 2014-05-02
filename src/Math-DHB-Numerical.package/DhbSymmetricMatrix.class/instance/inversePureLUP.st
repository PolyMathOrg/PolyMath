operation
inversePureLUP
		"Answer the inverse of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	lupDecomposition := nil.
	self lupDecomposition inverseMatrixComponents 
		ifNil: [ SingularMatrixError new signal ] 
		ifNotNilDo: [ :i| ^self class rows:i ].
