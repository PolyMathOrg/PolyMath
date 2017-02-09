operation
inversePureLUP
	"Answer the inverse of the receiver."

	lupDecomposition := nil.
	self lupDecomposition inverseMatrixComponents
		ifNil: [ SingularMatrixError new signal ]
		ifNotNil: [ :i | ^ self class rows: i ]