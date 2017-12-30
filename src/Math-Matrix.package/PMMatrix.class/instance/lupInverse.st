operation
lupInverse
	self lupDecomposition inverseMatrixComponents
		ifNil: [ PMSingularMatrixError new signal ]
		ifNotNil: [ :i | ^ self class rows: i ]