information
testVectorOnes
	| v |
	v := PMVector ones: 3.
	self assert: (v size) equals: 3.
	self assert: (v at: 1) equals: 1.
	self assert: (v at: 2) equals: 1.
	self assert: (v at: 3) equals: 1
	