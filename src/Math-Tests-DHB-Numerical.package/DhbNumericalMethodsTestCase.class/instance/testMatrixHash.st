comparing
testMatrixHash
	| a b c |
	a := DhbMatrix rows: #( (1 0) (0 1)).
	b := a deepCopy.
	self should: [a hash = b hash].
	c := a + b.
	self shouldnt: [a hash = c hash].