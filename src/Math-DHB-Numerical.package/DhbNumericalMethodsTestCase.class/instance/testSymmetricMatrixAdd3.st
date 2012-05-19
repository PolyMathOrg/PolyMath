linear algebra
testSymmetricMatrixAdd3
	| a b c |
	a := DhbMatrix rows: #( ( 11 12 13) (21 22 23) (31 32 33)).
	b := DhbSymmetricMatrix rows: #( ( 1 2 3) (-2 1 7) (0 0 0)).
	c := a + b.
	self should: [ c numberOfRows = 3].
	self should: [ c numberOfColumns = 3].
	self should: [ ((c rowAt: 1) at: 1) = 12].
	self should: [ ((c rowAt: 1) at: 2) = 14].
	self should: [ ((c rowAt: 1) at: 3) = 16].
	self should: [ ((c rowAt: 2) at: 1) = 19].
	self should: [ ((c rowAt: 2) at: 2) = 23].
	self should: [ ((c rowAt: 2) at: 3) = 30].
	self should: [ ((c rowAt: 3) at: 1) = 31].