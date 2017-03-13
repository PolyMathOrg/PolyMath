linear algebra
testMatrixMultiplyElementwise
	"Code Example 8.1"

	| a b c |
	a := PMMatrix rows: #(#(1 0 1) #(-1 -2 3)).
	b := PMMatrix rows: #(#(1 2 3) #(-2 1 7)).
	c := a dot:b.
	self assert: c numberOfRows equals: 2.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 1.
	self assert: ((c rowAt: 1) at: 2) equals: 0.
	self assert: ((c rowAt: 1) at: 3) equals: 3.
	self assert: ((c rowAt: 2) at: 1) equals: 2.
	self assert: ((c rowAt: 2) at: 2) equals: -2.
	self assert: ((c rowAt: 2) at: 3) equals: 21