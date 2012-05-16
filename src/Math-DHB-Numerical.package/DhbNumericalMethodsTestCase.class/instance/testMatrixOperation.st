linear algebra
testMatrixOperation
	"Code Example 8.1"
	| a b c |
	a := DhbMatrix rows: #( ( 1 0 1) (-1 -2 3)).
	b := DhbMatrix rows: #( ( 1 2 3) (-2 1 7) (5 6 7)).
	c := a * b.
	self should: [ c numberOfRows = 2].
	self should: [ c numberOfColumns = 3].
	self should: [ ((c rowAt: 1) at: 1) = 6].
	self should: [ ((c rowAt: 1) at: 2) = 8].
	self should: [ ((c rowAt: 1) at: 3) = 10].
	self should: [ ((c rowAt: 2) at: 1) = 18].
	self should: [ ((c rowAt: 2) at: 2) = 14].
	self should: [ ((c rowAt: 2) at: 3) = 4].