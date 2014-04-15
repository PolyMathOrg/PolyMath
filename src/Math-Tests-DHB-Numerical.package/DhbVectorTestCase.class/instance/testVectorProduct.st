linear algebra
testVectorProduct
	"Code Example 8.1"
	| u v |
	u := #(1 2 3) asDhbVector.
	v := #(3 4 5) asDhbVector.
	self should: [ u * v = 26].