operation
inversePureLUP
		"Answer the inverse of the receiver."
	lupDecomposition := nil.
	self lupDecomposition inverseMatrixComponents 
		ifNil: [ SingularMatrixError new signal ] 
		ifNotNilDo: [ :i| ^self class rows:i ].
