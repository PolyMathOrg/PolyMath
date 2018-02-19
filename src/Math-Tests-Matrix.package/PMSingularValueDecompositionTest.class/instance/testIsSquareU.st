tests
testIsSquareU
	"U should be a square matrix"

	| u |
		
	u := matrix decompose leftSingularForm.
	self
		assert: u numberOfRows
		equals: u numberOfColumns.