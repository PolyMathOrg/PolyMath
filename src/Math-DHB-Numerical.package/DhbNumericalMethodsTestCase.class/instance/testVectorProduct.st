linear algebra
testVectorProduct
	"Code Example 8.1"
	| u v |
	u := #(1 2 3) asVector.
	v := #(3 4 5) asVector.
	self should: [ u * v = 26].