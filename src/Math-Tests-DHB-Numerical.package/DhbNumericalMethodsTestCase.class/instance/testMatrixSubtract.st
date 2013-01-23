linear algebra
testMatrixSubtract
	| a b c |
	a := DhbMatrix rows: #( ( 1 0 1) (-1 -2 3)).
	b := DhbMatrix rows: #( ( 1 2 3) (-2 1 7)).
	c := a - b.
	self should: [ c numberOfRows = 2].
	self should: [ c numberOfColumns = 3].
	self should: [ ((c rowAt: 1) at: 1) = 0].
	self should: [ ((c rowAt: 1) at: 2) = -2].
	self should: [ ((c rowAt: 1) at: 3) = -2].
	self should: [ ((c rowAt: 2) at: 1) = 1].
	self should: [ ((c rowAt: 2) at: 2) = -3].
	self should: [ ((c rowAt: 2) at: 3) = -4].