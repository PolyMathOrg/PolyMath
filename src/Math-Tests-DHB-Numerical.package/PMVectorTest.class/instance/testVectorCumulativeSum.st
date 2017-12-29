tests
testVectorCumulativeSum
	"Code Example 8.1"

	| u w |
	u := #(1 2 3) asPMVector.
	w := u cumsum.
	self assert: (w size) equals: 3.
	self assert: (w at: 1) equals: 1.
	self assert: (w at: 2) equals: 3.
	self assert: (w at: 3) equals: 6