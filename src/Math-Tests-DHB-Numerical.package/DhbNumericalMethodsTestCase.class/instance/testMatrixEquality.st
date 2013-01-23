linear algebra
testMatrixEquality
	| a c |
	a := DhbMatrix rows: #( ( 1 0 1) (-1 -2 3)).
	c := a .
	self should: [ c numberOfRows =  a numberOfRows ].
	self should: [ c numberOfColumns = a numberOfColumns ].
	self should: [c = a and: [ a = c]].
