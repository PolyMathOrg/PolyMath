operation
inversePureLUP
	"Answer the inverse of the receiver."

	lupDecomposition := nil.
	self lupDecomposition inverseMatrixComponents
		ifNil: [ PMSingularMatrixError new signal ]
		ifNotNil: [ :i | ^ self class rows: i ]