tests
testShapeV
	"If A is an (m x n) matrix, then V should be an (n x n) matrix"

	| v n |
		
	v := matrix decompose rightSingularForm.
	n := matrix numberOfColumns.
	
	self assert: v numberOfRows equals: n.
	self assert: v numberOfColumns equals: n.