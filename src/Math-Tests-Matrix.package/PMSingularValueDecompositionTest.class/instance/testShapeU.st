tests
testShapeU
	"If A is an (m x n) matrix, then U should be an (m x m) matrix"

	| u m |
		
	u := matrix decompose leftSingularForm.
	m := matrix numberOfRows.
	
	self assert: u numberOfRows equals: m.
	self assert: u numberOfColumns equals: m.