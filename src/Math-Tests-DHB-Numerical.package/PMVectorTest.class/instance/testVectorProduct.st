linear algebra
testVectorProduct
	"Code Example 8.1"

	| u v |
	u := #(1 2 3) asPMVector.
	v := #(3 4 5) asPMVector.
	self assert: u * v equals: 26