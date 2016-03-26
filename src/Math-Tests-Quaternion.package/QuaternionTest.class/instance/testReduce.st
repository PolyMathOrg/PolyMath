running
testReduce
	self assert: q1234 reduce equals: q1234.
	self assert: q1 reduce equals: 1.
	self assert: q1 reduce isInteger.
	self assert: q12 reduce isComplexNumber.
	self assert: q12 reduce equals: (1 + 2 i) asComplex.
	self shouldnt: [ q123 reduce isComplexNumber ]