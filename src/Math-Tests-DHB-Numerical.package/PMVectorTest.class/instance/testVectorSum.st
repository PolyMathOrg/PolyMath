tests
testVectorSum
	"Code Example 8.1"

	| u |
	u := #(1 2 3) asPMVector.
	self assert: (u sum) equals: 6.