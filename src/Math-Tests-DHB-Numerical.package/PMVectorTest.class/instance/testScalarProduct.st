tests
testScalarProduct
	| u v |
	u := PMVector new: 3.
	v := PMVector new: 3.
	u
		at: 1 put: 1;
		at: 2 put: 1;
		at: 3 put: 1.
	v
		at: 1 put: 0;
		at: 2 put: 2;
		at: 3 put: 0.
	self assert: (u scalarProduct: v) equals: 2.
	v at: 1 put: 2.
	self assert: (u scalarProduct: v) equals: 4