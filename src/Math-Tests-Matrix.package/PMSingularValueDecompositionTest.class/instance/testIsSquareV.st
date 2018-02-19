tests
testIsSquareV
	"V should be a square matrix"

	| v |
		
	v := matrix decompose rightSingularForm.
	self
		assert: v numberOfRows
		equals: v numberOfColumns.