operation
lupInverse
	self lupDecomposition inverseMatrixComponents 
		ifNil: [ SingularMatrixError new signal ] 
		ifNotNilDo: [ :i| ^self class rows:i ].
