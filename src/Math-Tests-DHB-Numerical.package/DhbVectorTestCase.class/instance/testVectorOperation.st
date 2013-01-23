linear algebra
testVectorOperation
	"Code Example 8.1"
	| u v w |
	u := #(1 2 3) asVector.
	v := #(3 4 5) asVector.
	w := 4 * u + (3 * v).
	self should: [ w size = 3].
	self should: [ (w at: 1) = 13].
	self should: [ (w at: 2) = 20].
	self should: [ (w at: 3) = 27].