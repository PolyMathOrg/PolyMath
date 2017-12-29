tests
testVectorDotProduct
	"Code Example 8.1"

	| u v w |
	u := #(1 2 3) asPMVector.
	v := #(3 4 5) asPMVector.
	w := u dot: v.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: 3.
	self assert: (w at: 2) equals: 8.
	self assert: (w at: 3) equals: 15