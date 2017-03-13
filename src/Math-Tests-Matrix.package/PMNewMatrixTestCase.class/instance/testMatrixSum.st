linear algebra
testMatrixSum
	"Code Example 8.1"

	| a v |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	v := a sum.
	self assert: v size equals: 2.
	self assert: (v at: 1) equals: 2.
	self assert: (v at: 2) equals: 0