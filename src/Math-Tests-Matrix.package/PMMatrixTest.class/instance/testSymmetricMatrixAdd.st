linear algebra
testSymmetricMatrixAdd
	| a b c |
	a := (PMMatrix rows: #(#(11 12 13) #(12 22 23) #(13 23 33)))
		asSymmetricMatrix.
	b := PMMatrix rows: #(#(1 2 3) #(-2 1 7) #(0 0 0)).
	c := a + b.
	self assert: c numberOfRows equals: 3.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 12.
	self assert: ((c rowAt: 1) at: 2) equals: 14.
	self assert: ((c rowAt: 1) at: 3) equals: 16