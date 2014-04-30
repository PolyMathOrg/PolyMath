running
testReduce
	self should: [q1234 reduce = q1234].
	self should: [q1 reduce = 1].
	self should: [q1 reduce isInteger].
	self should: [q12 reduce isComplexNumber ].
	self should: [q12 reduce = (1 + 2 i) asComplex ].
	self shouldnt: [q123 reduce isComplexNumber ].