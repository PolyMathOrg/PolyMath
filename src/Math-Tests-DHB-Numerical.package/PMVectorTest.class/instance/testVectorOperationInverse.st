linear algebra
testVectorOperationInverse
	| u v w |
	u := #(1 2 3) asPMVector.
	v := #(3 4 5) asPMVector.
	w := v * 4 - (3 * u).
	self assert: w size equals: 3.
	self assert: (w at: 1) equals: 9.
	self assert: (w at: 2) equals: 10.
	self assert: (w at: 3) equals: 11