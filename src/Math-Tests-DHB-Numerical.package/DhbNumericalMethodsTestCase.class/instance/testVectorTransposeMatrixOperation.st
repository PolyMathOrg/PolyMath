linear algebra
testVectorTransposeMatrixOperation
	"Code Example 8.1"
	| c v w |
	c := DhbMatrix rows: #( ( 6 8 10) (18 14 4)).
	v := #(4 4) asVector.
	w := c transpose * v.
	self should: [ w size = 3].
	self should: [ (w at: 1) = 96].
	self should: [ (w at: 2) = 88].
	self should: [ (w at: 3) = 56].