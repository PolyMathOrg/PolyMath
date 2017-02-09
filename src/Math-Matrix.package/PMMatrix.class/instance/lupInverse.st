operation
lupInverse
	self lupDecomposition inverseMatrixComponents
		ifNil: [ SingularMatrixError new signal ]
		ifNotNil: [ :i | ^ self class rows: i ]