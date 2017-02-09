linear algebra
testVectorTransposeMatrixOperation
	"Code Example 8.1"

	| c v w |
	c := PMMatrix rows: #(#(6 8 10) #(18 14 4)).
	v := #(4 4) asDhbVector.
	w := c transpose * v.
	self assert: w size equals: 3.
	self assert: (w at: 1) equals: 96.
	self assert: (w at: 2) equals: 88.
	self assert: (w at: 3) equals: 56