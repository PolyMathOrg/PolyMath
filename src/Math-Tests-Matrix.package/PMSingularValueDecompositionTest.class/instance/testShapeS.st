tests
testShapeS
	"If A is an (m x n) matrix, then S should be an (m x n) matrix"

	| s m n |
		
	s := matrix decompose sForm.
	m := matrix numberOfRows.
	n := matrix numberOfColumns.
	
	self assert: s numberOfRows equals: m.
	self assert: s numberOfColumns equals: n.