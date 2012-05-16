linear algebra
testMatrixInversionSmall

	| m c |
	m := DhbMatrix rows: #( (3 2 4) (2 -5 -1) ( 1 -2 2)).
	c := m inverse * m.
	self should: [ c numberOfRows = 3].
	self should: [ c numberOfColumns = 3].
	self should: [ ((c rowAt: 1) at: 1) = 1].
	self should: [ ((c rowAt: 1) at: 2) = 0].
	self should: [ ((c rowAt: 1) at: 3) = 0].
	self should: [ ((c rowAt: 2) at: 1) = 0].
	self should: [ ((c rowAt: 2) at: 2) = 1].
	self should: [ ((c rowAt: 2) at: 3) = 0].
	self should: [ ((c rowAt: 3) at: 1) = 0].
	self should: [ ((c rowAt: 3) at: 2) = 0].
	self should: [ ((c rowAt: 3) at: 3) = 1].