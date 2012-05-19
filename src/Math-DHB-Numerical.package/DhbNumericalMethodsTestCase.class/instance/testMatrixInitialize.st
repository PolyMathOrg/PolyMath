linear algebra
testMatrixInitialize
	| a |
	a := DhbMatrix new initialize: 2.
	self should: [a numberOfRows = 2].
	self should: [a numberOfColumns = 2].
	