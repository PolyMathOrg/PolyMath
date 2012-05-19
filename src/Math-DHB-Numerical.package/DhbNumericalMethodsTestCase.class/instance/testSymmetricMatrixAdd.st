linear algebra
testSymmetricMatrixAdd
	| a b c |
	a := (DhbMatrix rows: #( ( 11 12 13) (12 22 23) (13 23 33))) asSymmetricMatrix .
	b := DhbMatrix rows: #( ( 1 2 3) (-2 1 7) (0 0 0)).
	c := a + b.
	self should: [ c numberOfRows = 3].
	self should: [ c numberOfColumns = 3].
	self should: [ ((c rowAt: 1) at: 1) = 12].
	self should: [ ((c rowAt: 1) at: 2) = 14].
	self should: [ ((c rowAt: 1) at: 3) = 16].
