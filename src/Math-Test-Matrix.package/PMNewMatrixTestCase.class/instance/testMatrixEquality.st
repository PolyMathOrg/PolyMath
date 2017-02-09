linear algebra
testMatrixEquality
	| a c |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	c := a.
	self assert: c numberOfRows equals: a numberOfRows.
	self assert: c numberOfColumns equals: a numberOfColumns.
	self assert: (c = a and: [ a = c ])