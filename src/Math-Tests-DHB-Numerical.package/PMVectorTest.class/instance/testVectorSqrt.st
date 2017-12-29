linear algebra
testVectorSqrt
	"Code Example 8.1"

	| u w |
	u := #(1 4 9) asPMVector.
	w := u sqrt.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: 1.
	self assert: (w at: 2) equals: 2.
	self assert: (w at: 3) equals: 3