linear algebra
testSymmetricMatrixAdd3
	| a b c |
	a := DhbMatrix rows: #(#(11 12 13) #(21 22 23) #(31 32 33)).
	b := DhbSymmetricMatrix rows: #(#(1 2 3) #(-2 1 7) #(0 0 0)).
	c := a + b.
	self assert: c numberOfRows equals: 3.
	self assert: c numberOfColumns equals: 3.
	self assert: ((c rowAt: 1) at: 1) equals: 12.
	self assert: ((c rowAt: 1) at: 2) equals: 14.
	self assert: ((c rowAt: 1) at: 3) equals: 16.
	self assert: ((c rowAt: 2) at: 1) equals: 19.
	self assert: ((c rowAt: 2) at: 2) equals: 23.
	self assert: ((c rowAt: 2) at: 3) equals: 30.
	self assert: ((c rowAt: 3) at: 1) equals: 31