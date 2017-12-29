tests
testVectorZeros
	| v |
	v := PMVector zeros: 3.
	self assert: (v size) equals: 3.
	self assert: (v at: 1) equals: 0.
	self assert: (v at: 2) equals: 0.
	self assert: (v at: 3) equals: 0
	